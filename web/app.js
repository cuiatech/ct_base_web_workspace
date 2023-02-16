var serviceWorkerVersion = null;
var scriptLoaded = false;

function loadMainDartJs() {
  if (scriptLoaded) return;

  scriptLoaded = true;
  var scriptTag = document.createElement("script");

  scriptTag.src = "main.dart.js";
  scriptTag.type = "application/javascript";

  document.body.append(scriptTag);
}

if ("serviceWorker" in navigator) {
  window.addEventListener("load", function () {
    var serviceWorkerUrl =
      "flutter_service_worker.js?v=" + serviceWorkerVersion;

    navigator.serviceWorker.register(serviceWorkerUrl).then((reg) => {
      const { active, installing, waiting } = reg;
      function waitForActivation(serviceWorker) {
        serviceWorker.addEventListener("statechange", () => {
          if (serviceWorker.state == "activated") loadMainDartJs();
        });
      }

      if (!active && (installing || waiting)) {
        waitForActivation(installing ?? waiting);
      } else if (!active.scriptURL.endsWith(serviceWorkerVersion)) {
        reg.update();
        waitForActivation(installing);
      } else {
        loadMainDartJs();
      }
    });

    setTimeout(() => {
      if (!scriptLoaded) loadMainDartJs();
    }, 4000);
  });
} else {
  loadMainDartJs();
}
