# 🍶 Sake Guide

**Sake Guide** is a simple iOS application built using SwiftUI and the MVVM architecture. The app presents a curated list of sake shops with details like name, rating, address, images, and external links. It uses only native Swift frameworks—**no third-party libraries**—making it lightweight and easy to maintain.

---

## 📱 Features

- 🍶 Browse a list of sake shops with photos, ratings, and addresses  
- 📍 View detailed shop info including Google Maps & website links  
- 📸 Async image loading using a custom `AsyncImageView` (compatible with iOS 14+)  
- ❤️ Bookmark shops to save your favorites  
- 🗺️ View shop location on a map using MapKit  
- 🧠 Clean MVVM design for testability and separation of concerns  

---

## 🏗 Architecture

The project is structured using the **Model-View-ViewModel (MVVM)** design pattern:

Sake Guide/
├── Models/ # SakeModel.swift
├── Views/ # ContentView, StoryRow, SakeDetailView, MapView, AsyncImageView
├── ViewModels/ # SakeViewModel.swift
├── Resources/ # Assets, JSON, or mock data


---

## 🚀 Getting Started

1. Clone the repo  
2. Open `Sake Guide.xcodeproj`  
3. Build & run on an iOS 14+ simulator or device  

✅ No CocoaPods, Carthage, or Swift Package Manager required.

---

## 🧭 Next Steps

The following features are planned or suggested for future development:

- ✅ **Bookmark persistence**  
  Store liked shops using `UserDefaults` or a shared data service

- 🔍 **Sorting and Filtering**  
  Add UI controls to sort by rating or filter by location, category, etc.

- 🗺 **Map-based Search**  
  Display sake shops on a full map view with tapable annotations

- 📍 **Geolocation Services**  
  Use CoreLocation to show the nearest shops to the user

- 🧪 **Unit tests**  
  Add unit and UI testing to validate view models and data parsing

- 🌐 **Localization**  
  Support for Japanese and other languages

---

## 📦 Requirements

- Xcode 12 or later  
- iOS 14.0+  
- Swift 5

---

## 📄 License

MIT License (or specify your own)

---

## 🙌 Contributions

Feel free to fork this repo and open a pull request for any improvements or fixes. Feedback is always welcome!

