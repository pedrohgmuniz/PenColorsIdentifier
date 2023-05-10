//
//  CameraFrameHandler.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 10/05/23.
//

import AVFoundation
import CoreImage

class CameraFrameHandler: NSObject, ObservableObject {
    @Published var frame: CGImage?
    private var permissionGranted = false
    private let captureSesion = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private let context = CIContext()

    override init() {
        super.init()
        checkPermission()
        sessionQueue.async { [unowned self] in
            self.setupCaptureSession()
            self.captureSesion.startRunning()
        }
    }

    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            permissionGranted = true

        case .notDetermined:
            requestPermission() // need to add this to the project, in Info

        default: permissionGranted = false
        }
    }

    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
        }
    }

    func setupCaptureSession() {
        let videoOutput = AVCaptureVideoDataOutput()

        guard permissionGranted else { return }
        guard let videoDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) else { return }
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        guard captureSesion.canAddInput(videoDeviceInput) else { return }
        captureSesion.addInput(videoDeviceInput)

        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSesion.addOutput(videoOutput)
        videoOutput.connection(with: .video)?.videoOrientation = .portrait // This rotates the frame into portrait orientation
    }
}

extension CameraFrameHandler: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let cgImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }

        DispatchQueue.main.async { [unowned self] in
            self.frame = cgImage
        }
    }

    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> CGImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }

        return cgImage
    }

}
