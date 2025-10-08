Nova — package for appbuild.io
=============================

Files included:
- Sources/NOVAApp/*.swift — SwiftUI app with WelcomeView and MainWebView.
- Resources/www — your web app files (index.html etc.).
- Resources/LaunchScreen.storyboard, Resources/Assets.xcassets — placeholder assets.

Goal:
Upload this ZIP to https://appbuild.io (or similar) to build a signed .ipa without macOS. Then install the .ipa to your iPhone 16 using AltStore.

Steps to build on appbuild.io:
1. Go to https://appbuild.io and create an account.
2. Create a new iOS build and upload this ZIP file (Nova_for_appbuild.zip).
   - For signing, use your Apple ID credentials (or use a separate test Apple ID).
   - Choose Development signing if available.
3. Start the build — wait for the build to finish and download the produced .ipa.

Install on iPhone via AltStore (from Windows):
1. Install AltServer on Windows: https://altstore.io and run it.
2. Connect your iPhone via USB and install AltStore to your device via AltServer.
3. Open AltStore on the device, go to My Apps → + → select the .ipa file downloaded from appbuild.io.
4. AltStore will sign and install the app on your device (re-signing required every 7 days for free Apple ID).

Notes:
- If your web app requires a production build step (React/Vite), build locally (npm run build) and replace Resources/www with the contents of build/dist before zipping.
- appbuild.io may request provisioning/profile info — follow their UI. If you prefer not to supply Apple ID to third-party, rent a Mac in the cloud (MacStadium) and follow Xcode steps in the other README.

