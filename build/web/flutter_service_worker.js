'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2f2fa7a52237bf5c587679cfd8c0bd84",
"assets/AssetManifest.bin.json": "6e7453a6f28e76c10a93c164d47409b3",
"assets/AssetManifest.json": "9a0443c3864c8fee68739f360f90c11b",
"assets/assets/fonts/Poppins-Bold.ttf": "25b0e113ca7cce3770d542736db26368",
"assets/assets/fonts/Poppins-Medium.ttf": "a09f2fccfee35b7247b08a1a266f0328",
"assets/assets/fonts/Poppins-Regular.ttf": "9212f6f9860f9fc6c69b02fedf6db8c3",
"assets/assets/fonts/Poppins-SemiBold.ttf": "72993dddf88a63e8f226656f7de88e57",
"assets/assets/icons/bank.svg": "b09fdd8721ae35ca3a73d58895510112",
"assets/assets/icons/beach.png": "95ed3f2cb8f04bb3fd5f3a341636f987",
"assets/assets/icons/beach.svg": "33068359d0e6f20037827d45658d267b",
"assets/assets/icons/beach_cleanup.jpg": "6b5d68b33013931115a4aee52f589120",
"assets/assets/icons/coffee.svg": "9dfa12a86f406db17930e2bbec07b282",
"assets/assets/icons/consultation.svg": "7ecf027b5dd459424bc6552900ac00b6",
"assets/assets/icons/credit_card.svg": "d10404295f2764da3105b8ba11e106d1",
"assets/assets/icons/green-car.png": "97a72dbfb142e62a7231186e2dde4124",
"assets/assets/icons/leaf.svg": "4b903335e95a2dcf3962e8203d393b61",
"assets/assets/icons/loan.svg": "ac6c655163eb2e324f7f3af501d4c920",
"assets/assets/icons/public_transport.svg": "f636b2c61c9b47af91fff0f8e1711d64",
"assets/assets/icons/recycle.png": "9477daae8d7bc29074d0e1ea162fbbb3",
"assets/assets/icons/recycle.svg": "393262489559845e4e50b87b19bfd1e5",
"assets/assets/icons/recycle_bottles.svg": "1331c885df84ab4e27acff62c1942d17",
"assets/assets/icons/recycling.png": "450bca722d956416d77f766611224b52",
"assets/assets/icons/reduce_energy.svg": "6fa50208ac673627f5a486a0b53ddaeb",
"assets/assets/icons/save-energy.png": "7b0b3d0e38787e38c9505870bc5ea7cc",
"assets/assets/icons/shopping.svg": "1bec526da8c002165a80d9d5229405e7",
"assets/assets/icons/tree.svg": "649cd5ed6c7c3699c13ab0df5ac049ec",
"assets/assets/icons/tree_planting.jpg": "270f6018ee158b8360b19f6aace93792",
"assets/assets/icons/water-bottle.png": "423b7baf8aaba3a70d54d37e02fb861b",
"assets/assets/images/alexbank_logo.png": "d7e7c04b7e0ba31b4d40ba1f31de916b",
"assets/assets/images/beach_cleanup.svg": "542717cbdf32c14be994d2c019dafeab",
"assets/assets/images/chatbot.png": "5b7597f52e67e469ab8c63e8e83d118f",
"assets/assets/images/gree_alex_logo.png": "61f8986ee45a7d9ab9aaf38fb44eddff",
"assets/assets/images/partners/Banlastic%2520Egypt.png": "8bed7492167d7c8673706b8e91347405",
"assets/assets/images/partners/Bekia.png": "dc2a9e13b7d5ec97e4e76fcc9b1b52cf",
"assets/assets/images/partners/Greenish.png": "a871065daf51f90664835587bd571101",
"assets/assets/images/partners/VeryNile.jpeg": "94ae6ded983eb6e488c8f5afdfba335a",
"assets/assets/images/partners/Youth%2520Loves%2520Egypt.jpeg": "a79e4de5223e013c83a2d25d34fe0fc7",
"assets/assets/images/tree_planting.svg": "9ab5d38d1c611368dd69441ffcd7a1ef",
"assets/assets/images/welcome_bg.svg": "82be701cf7835238661a5ebe3541e4fb",
"assets/assets/logos/Eco%2520Cyborg.json": "58c31b5ad48e111d7de4efcb8fc8ce22",
"assets/assets/logos/gree_alex_logo.png": "61f8986ee45a7d9ab9aaf38fb44eddff",
"assets/FontManifest.json": "92818e61d2b3673d24f9b8edfad3c095",
"assets/fonts/MaterialIcons-Regular.otf": "6a46162027fe6497f61aa26ad006287a",
"assets/NOTICES": "1a4cfe390dacdadda7b258e62c2c83b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "96cb6d05e2789ad61acb7abcc0f1c31d",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "9d7622b6a9890fca353730d154b6f7b4",
"icons/gree_alex_logo.png": "61f8986ee45a7d9ab9aaf38fb44eddff",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "269892909d71846ec121ac7023df8ff4",
"/": "269892909d71846ec121ac7023df8ff4",
"main.dart.js": "ce0e275c15dcaa2648f2bba00f222612",
"manifest.json": "517e368f7563fd5d1f2779a59c65608b",
"version.json": "1ea3e7faeda329745921e6d2ebc5cd90"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
