NOVA iOS — Ready for .ipa (Debug)
================================

What I prepared for you
- A SwiftUI app (Sources/NOVAApp/NOVAApp.swift) that loads `Resources/www/index.html` in a WKWebView.
- A LaunchScreen.storyboard and Assets.xcassets with placeholder app icons and a launch image (replace these with your own images if desired).
- All web files from your uploaded archive copied into `Resources/www` (if your archive lacked a production `build`/`dist`, the raw files are used). If your web app requires a build step (React/Vite), create a production build locally and replace `Resources/www` with the contents of the `build` or `dist` folder.

Important limitation
- I still cannot build or sign an .ipa inside this environment. Building a Debug .ipa requires Xcode on a Mac and your Apple ID for signing (or a Team provisioning profile). I prepared everything so that **you only need to open the project in Xcode and press Build/Archive**.

Steps to produce a Debug .ipa (exact)
1. Transfer `NOVA_iOS_App` folder to a Mac and open Xcode (13+ recommended).
2. In Xcode: File → New → Project → App → Interface: SwiftUI, Life Cycle: SwiftUI, Language: Swift. Create a new temporary project (name doesn't matter).
3. Replace the project's default App and ContentView with the files from `NOVA_iOS_App/Sources/NOVAApp/` (drag NOVAApp.swift into the Project navigator). Or alternatively, delete the temporary project's Sources and add the `Sources/NOVAApp` folder from this package.
4. Drag the `Resources` folder (the whole folder) into the project navigator. When prompted, choose "Create folder references" so the folder is copied into the bundle.
5. Open the project target → General tab:
   - Display Name: NOVA (or your choice)
   - Bundle Identifier: change to a unique reverse-domain (e.g. com.YOURNAME.NOVA)
   - Deployment Info → iOS Deployment Target: set to a reasonable minimum (iOS 10 or 12) — to support iPhone 5/5s you may need iOS 10 (note: some modern WKWebView features require newer iOS).
6. Signing & Capabilities:
   - Check "Automatically manage signing".
   - Select your Team (Apple ID). If you don't have an Apple Developer paid account, Xcode can still sign Debug builds with your personal free Apple ID for installing to a device connected to the Mac.
7. Build & Run on a device via Xcode → choose a connected iPhone and click Run, or:
   - Product → Archive (to create an archive)
   - When Archive completes, choose Distribute App → Development → Export as an IPA for Ad-Hoc/Development.
   - Xcode will sign the .ipa using your selected provisioning profile and certificate.
8. Install the .ipa on your iPhone:
   - Use Apple Configurator 2 or `ios-deploy` or install via Xcode's Devices window (Window → Devices and Simulators → + to install the .ipa). If you used a personal free Apple ID, you may need to trust the developer profile on the device (Settings → General → Device Management).

If you want, I can:
- Produce an .xcodeproj file automatically (I can attempt to create a minimal project file here), or
- Guide you step-by-step while you open Xcode, and produce screenshots and exact menu clicks.
