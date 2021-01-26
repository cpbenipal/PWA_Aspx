 var PRECACHE_URLS = [
    new Request('Employees.aspx'),
    new Request('Rating.aspx'),
    new Request('/assets/favicon.png') 
]; 
const PRECACHE = 'precache-v1';
const RUNTIME = 'runtime';      
var version = 'v1::';
// The install handler takes care of precaching the resources we always need.
self.addEventListener("install", function (event) {
    console.log('WORKER: install event in progress.');
    event.waitUntil(
        /* The caches built-in is a promise-based API that helps you cache responses,
           as well as finding and deleting them.
        */
        caches
            /* You can open a cache by name, and this method returns a promise. We use
               a versioned cache name here so that we can remove old cache entries in
               one fell swoop later, when phasing out an older service worker.
            */
            .open(version + 'fundamentals')
            .then(function (cache) {
                /* After the cache is opened, we can fill it with the offline fundamentals.
                   The method below will add all resources we've indicated to the cache,
                   after making HTTP requests for each of them.
                */
                return cache.addAll(PRECACHE_URLS);
            })
            .then(function () {
                console.log('WORKER: install completed');
            })
    );
});

self.addEventListener("activate", function (event) {
    /* Just like with the install event, event.waitUntil blocks activate on a promise.
       Activation will fail unless the promise is fulfilled.
    */
     

    event.waitUntil(
        caches
            /* This method returns a promise which will resolve to an array of available
               cache keys.
            */
            .keys()
            .then(function (keys) {
                // We return a promise that settles when all outdated caches are deleted.
                return Promise.all(
                    keys
                        .filter(function (key) {
                            // Filter by keys that don't start with the latest version prefix.
                            return !key.startsWith(version);
                        })
                        .map(function (key) {
                            /* Return a promise that's fulfilled
                               when each outdated cache is deleted.
                            */
                            return caches.delete(key);
                        })
                );
            })
            .then(function () {
                console.log('WORKER: activate completed.');
            })
    );
});

self.addEventListener('fetch', function (event) {        
    event.respondWith(
        caches.match(event.request, {
            ignoreSearch: true
        }).then(function (response) {            
            return response || fetch(event.request);
        })
    );
});

       
