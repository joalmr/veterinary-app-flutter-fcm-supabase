'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "c35b41e943a190f5ef95131ab9f019ff",
"index.html": "8f40f238ae0d0954b731cea07b7ce418",
"/": "8f40f238ae0d0954b731cea07b7ce418",
"main.dart.js": "b834eb9ab6622aa32366f662960db8ba",
"favicon.png": "aef33633c5c0bfb10897eb82347464ec",
"icons/Icon-192.png": "e194ee209513d7cea638e75388a8d16c",
"icons/Icon-512.png": "e889d96fb4bc64d7cbacbdac99955a83",
"manifest.json": "acefdfc29fdc72d96b1d1d980fe1fa4b",
"assets/AssetManifest.json": "8600b80197c9b11a9b55f42c157976ad",
"assets/NOTICES": "a3c8ce7df516fe91e46bd3d7ce68015b",
"assets/FontManifest.json": "98e7eafbee58d78dd223ef40013ca33f",
"assets/packages/day_night_time_picker/assets/moon.png": "71137650ab728a466a50fa4fa78fb2b9",
"assets/packages/day_night_time_picker/assets/sun.png": "5fd1657bcb73ce5faafde4183b3dab22",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/map_style.txt": "8fe8faa2b465a1070f80d7dc45d96b0c",
"assets/assets/images/svg/juguete.svg": "1b2c8e610fe8e7b7420487b213e6c6b6",
"assets/assets/images/svg/otro.svg": "fb932f3c64c9a8b8c60c4d5cef68652a",
"assets/assets/images/svg/vestimenta.svg": "665e3c6e226601ccaa960549aa551887",
"assets/assets/images/svg/farmaco.svg": "87171c9710a43839c24e43c989bd3239",
"assets/assets/images/svg/higiene.svg": "673b6aef37840ac6eb4d7c2197430429",
"assets/assets/images/svg/accesorio.svg": "a34c08c7d9e6d7a3b067836a3d8df543",
"assets/assets/images/svg/alimento.svg": "4d658f5f5d115b7dd1612b50ccb64359",
"assets/assets/images/dog.jpg": "a88ee9ae496d7fe042110a495ed908a3",
"assets/assets/images/decrease.png": "d9ac775699a7d31ab82c1343ff4ba048",
"assets/assets/images/vote.png": "5dc3df38cc64189d95a0c80081569e4e",
"assets/assets/images/increase.png": "6b46a9020ae1df274bd644224f9eb4f2",
"assets/assets/images/portada.jpg": "867ae43b3fd9e327e98448f93032ef6a",
"assets/assets/images/empty.png": "c9477b1f1820f9acfb93eebb2e6679c2",
"assets/assets/images/logo-proypet.png": "4d1acab72b89e9c34b004220c8e39039",
"assets/assets/images/google-play.png": "a1cb6d28800c97de2b61431dbc027e31",
"assets/assets/images/vetfoto.jpg": "d735192ecde544f550ca73e21ab97fc9",
"assets/assets/images/proypet-partner.png": "2521076ce362d043855cf87025a10624",
"assets/assets/images/call-green.png": "25d7db2746496a06f300daa165a2d80c",
"assets/assets/images/lottie/check.json": "7e0a1eaea721e81b0d8773d69a224d68",
"assets/assets/images/lottie/loading-circulo.json": "01c2fdebdd3b355a101d71fa22b370b0",
"assets/assets/images/folder-bro.png": "dc3310feff9f3357539946fe134287b3",
"assets/assets/images/app-store.png": "5af206a86e9801abca6f4be5227d2273",
"assets/assets/fonts/IconProypet.ttf": "fcd29f624dde5d30e39b69ffeeab2dea"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
