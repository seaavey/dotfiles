/****************************************************************************
 * Firefox Optimized user.js for Lenovo Laptop
 * Hardware Specs:
 * - CPU: Intel Core i5-6200U (2 cores / 4 threads @ 2.30GHz)
 * - RAM: 8GB DDR3L/DDR4
 * - GPU: Intel HD Graphics 520 (Skylake GT2)
 * - OS / WM: Arch Linux + Hyprland (Wayland)
 ****************************************************************************/

/****************************************************************************
 * SECTION 1: HARDWARE VIDEO ACCELERATION & WEBRENDER (Intel HD 520 / Wayland)
 ****************************************************************************/
// Enable VA-API hardware video acceleration on Linux Wayland
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.hardware-video-decoding.enabled", true);
user_pref("media.rdd-ffmpeg.enabled", true);
user_pref("widget.dmabuf.force-enabled", true);

// Enable hardware WebRender (offloads layout/rendering from dual-core CPU to GPU)
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor", true);
user_pref("layers.gpu-process.enabled", true);

// IMPORTANT FOR SKYLAKE (HD 520):
// Skylake iGPU does NOT have hardware decode for AV1 or VP9.
// Without disabling them, YouTube uses software decode on CPU (causes 80-100% CPU usage & heat).
// Disabling AV1 and VP9 forces video platforms to serve hardware-accelerated H.264 (AVC) with ~5% CPU.
user_pref("media.av1.enabled", false);
user_pref("media.mediasource.vp9.enabled", false);

/****************************************************************************
 * SECTION 2: CPU & PROCESS OPTIMIZATION (Intel 2 Cores / 4 Threads)
 ****************************************************************************/
// Reduce isolated web content processes from 8+ down to 3.
// Having 8+ processes on a dual-core CPU causes heavy thread context switching and wastes RAM.
user_pref("dom.ipc.processCount", 3);
user_pref("dom.ipc.processCount.webIsolated", 3);

// Optimize rendering delay and reflow notifications
user_pref("content.notify.interval", 100000); // 0.10s (smoother, avoids reflow thrashing)
user_pref("gfx.content.skia-font-cache-size", 20); // 20MB font cache

/****************************************************************************
 * SECTION 3: RAM & TAB MANAGEMENT (8GB RAM Optimization)
 ****************************************************************************/
// Aggressively unload inactive tabs when free memory gets low (avoids system freeze/OOM)
user_pref("browser.tabs.unloadOnLowMemory", true);
user_pref("browser.low_commit_space_threshold_mb", 1536); // Trigger at ~1.5GB remaining

// Limit Back-Forward cache per tab to 3 pages (default can store dozens of pages in RAM)
user_pref("browser.sessionhistory.max_total_viewers", 3);

// Cap memory cache size to 512MB (prevents memory bloat during prolonged browsing)
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.capacity", 524288); // 512MB
user_pref("browser.cache.memory.max_entry_size", 51200); // 50MB

/****************************************************************************
 * SECTION 4: DISK I/O & SSD PERFORMANCE
 ****************************************************************************/
// Increase session store write interval from 15s to 60s (reduces SSD writes and micro-freezes)
user_pref("browser.sessionstore.interval", 60000);

// Limit disk cache to 512MB
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.capacity", 524288); // 512MB

/****************************************************************************
 * SECTION 5: NETWORK & PAGE LOAD RESPONSIVENESS
 ****************************************************************************/
// Enable HTTP/3 (QUIC)
user_pref("network.http.http3.enable", true);

// Disable speculative prefetching to save bandwidth, RAM, and dual-core CPU cycles
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.predictor.enabled", false);

/****************************************************************************
 * SECTION 6: SMOOTH SCROLLING & WAYLAND INTEGRATION
 ****************************************************************************/
user_pref("general.smoothScroll", true);
user_pref("widget.use-aspect-ratio", true);
user_pref("widget.wayland.fractional-scale.enabled", true);

/****************************************************************************
 * SECTION 7: DISABLE BLOATWARE & BACKGROUND TELEMETRY (Saves CPU & RAM)
 ****************************************************************************/
// Disable Pocket
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// Disable Telemetry & Studies
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("browser.discovery.enabled", false);

// Disable sponsored shortcuts & suggestions on new tab
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.tabs.firefox-view", false);
