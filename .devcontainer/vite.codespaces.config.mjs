// Codespaces 專用設定：沿用原本的 vite.config.ts，只加三件事
// 1. 允許 *.app.github.dev 網址連進來
// 2. 把 /v1、/ws、/j 轉給本機的 OpenWorker 伺服器（127.0.0.1:8765）
// 3. 轉發時把來源（Origin）改成 localhost，通過伺服器的安全檢查
import base from "./vite.config.ts";

const BACKEND = "http://127.0.0.1:8765";
const LOCAL_ORIGIN = "http://localhost:1420";
const asLocal = (proxy) => {
  proxy.on("proxyReq", (req) => req.setHeader("origin", LOCAL_ORIGIN));
  proxy.on("proxyReqWs", (req) => req.setHeader("origin", LOCAL_ORIGIN));
};

export default async (env) => {
  const cfg = typeof base === "function" ? await base(env) : base;
  return {
    ...cfg,
    server: {
      ...cfg.server,
      host: "0.0.0.0",
      allowedHosts: [".app.github.dev"],
      proxy: {
        "/v1": { target: BACKEND, changeOrigin: true, configure: asLocal },
        "/ws": { target: BACKEND.replace("http", "ws"), ws: true, changeOrigin: true, configure: asLocal },
        "/j": { target: BACKEND, changeOrigin: true, configure: asLocal },
      },
    },
  };
};
