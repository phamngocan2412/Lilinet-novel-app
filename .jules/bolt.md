## 2024-05-23 - [Flutter Image Caching Optimization]
**Learning:** `CachedNetworkImage` defaults to full resolution or suboptimal fallbacks if `memCacheWidth` is not explicitly set or set based on logical width without pixel ratio. Wrapping it in `LayoutBuilder` allows us to size the memory cache to the exact physical pixels needed (`constraints.maxWidth * devicePixelRatio`), saving significant memory on grids/lists.
**Action:** Always wrap `CachedNetworkImage` (or custom wrappers) in `LayoutBuilder` when `width` is dynamic/infinite to determine optimal cache size.
