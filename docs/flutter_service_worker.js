'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.png": "1effaf8b5ebdd82faa8e8fb826b82960",
"assets/fonts/MaterialIcons-Regular.otf": "76ac0af6279fde887a4781c609d0604c",
"assets/packages/golden_toolkit/fonts/Roboto-Regular.ttf": "ac3f799d5bbaf5196fab15ab8de8431c",
"assets/assets/tada.json": "1c048e3dcef83700b53981abe2b8362f",
"assets/assets/fonts/zentaku_gothic_new/ZenKakuGothicNew-Bold.ttf": "a421598d8bd036ef6aa53afd7d69a212",
"assets/assets/fonts/zentaku_gothic_new/ZenKakuGothicNew-Black.ttf": "5ec0eb8c00dc50cb3b890b7191e8674a",
"assets/assets/fonts/zentaku_gothic_new/OFL.txt": "a50b61c23ff5a8e347a148ac62b30492",
"assets/assets/fonts/zentaku_gothic_new/ZenKakuGothicNew-Light.ttf": "26a0e264098feb60601d59f2ce40bc5e",
"assets/assets/fonts/zentaku_gothic_new/ZenKakuGothicNew-Regular.ttf": "8b87592531f42ab43e12b2f0b97f2381",
"assets/assets/fonts/zentaku_gothic_new/ZenKakuGothicNew-Medium.ttf": "a1e48fa0f681afdde9a24199223478e1",
"assets/assets/fonts/roboto_mono/RobotoMono-Medium.ttf": "b090e3202375adb631519fab6bf121c2",
"assets/assets/fonts/roboto_mono/RobotoMono-SemiBoldItalic.ttf": "62e6605f714a9c782695bed8eb0882f3",
"assets/assets/fonts/roboto_mono/RobotoMono-LightItalic.ttf": "ee67c6f89219bab25719962baf52abdd",
"assets/assets/fonts/roboto_mono/LICENSE.txt": "d273d63619c9aeaf15cdaf76422c4f87",
"assets/assets/fonts/roboto_mono/RobotoMono-Bold.ttf": "0339b745f10bb01da181af1cdc33c361",
"assets/assets/fonts/roboto_mono/RobotoMono-BoldItalic.ttf": "a4cab46969174b31ea19a358243688c5",
"assets/assets/fonts/roboto_mono/RobotoMono-Thin.ttf": "d1a7b45f28bf337cab8adf3992f669a0",
"assets/assets/fonts/roboto_mono/RobotoMono-ThinItalic.ttf": "adc49ca2fcfd159898decbcee230c865",
"assets/assets/fonts/roboto_mono/RobotoMono-ExtraLightItalic.ttf": "4d323d0f9dcfc8f2cec7dd181ddc6ada",
"assets/assets/fonts/roboto_mono/RobotoMono-Regular.ttf": "7e173cf37bb8221ac504ceab2acfb195",
"assets/assets/fonts/roboto_mono/RobotoMono-ExtraLight.ttf": "b8b8a584a0b8307e1aa11f9f037a0502",
"assets/assets/fonts/roboto_mono/RobotoMono-Italic.ttf": "9eb6854ad766566c29d1bb5711504345",
"assets/assets/fonts/roboto_mono/RobotoMono-Light.ttf": "14fa2a726b29e8805e287c002ab64397",
"assets/assets/fonts/roboto_mono/RobotoMono-MediumItalic.ttf": "84aa53c3bad6d41469bc47846baa6183",
"assets/assets/fonts/roboto_mono/RobotoMono-SemiBold.ttf": "e9372f334303337690d46c5a169f3b10",
"assets/assets/party_popper.json": "595e94e906635daeda321e4b48f9d277",
"assets/assets/clapping.json": "44fefe0024d864a75cc4878fe5e88206",
"assets/assets/bell.mp3": "35938d7c0bba9864438522d503840757",
"assets/assets/clapping.mp3": "c424ed6a96f5c142631b124dd7eb014e",
"assets/AssetManifest.json": "bae09fc38b4dbffd3db9915e61414559",
"assets/NOTICES": "40b49f4e428e0d529477a765ecc0c5cd",
"assets/FontManifest.json": "6f5744f40eb3064f030b4e03a74f67a5",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "b48bf6fd2481611b8b6c5252a6eaf016",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"index.html": "de5e1afda1d618486cb4ba352ef164b8",
"/": "de5e1afda1d618486cb4ba352ef164b8",
"manifest.json": "da2a4514e07c120149f4ddd129c96373",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"version.json": "e8a9647d85360158842af075656d5233",
"icons/Icon-512.png": "a3abb8a14302c27c799d10de3b7236d6",
"icons/Icon-maskable-192.png": "a91d5efa6fefaf4cceccfd6016b269d0",
"icons/Icon-192.png": "a91d5efa6fefaf4cceccfd6016b269d0",
"icons/Icon-maskable-512.png": "a3abb8a14302c27c799d10de3b7236d6",
"main.dart.js": "f1c5e75fcc34320fd290bd0637ec8bb2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
