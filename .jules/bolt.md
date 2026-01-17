## 2026-01-17 - [Adaptive Image Memory Caching]
**Learning:** Hardcoding memory cache sizes in image widgets (e.g., `memCacheWidth: width * 2`) is inefficient. It over-consumes memory on low-density screens and under-delivers quality on high-density ones. The optimal approach is to calculate the precise render size (Logical Width * DevicePixelRatio) and pass it explicitly to the image provider.
**Action:** When implementing grid or list views with images, always calculate the exact item width in the parent widget and pass it down as `memCacheWidth` to the image component.
