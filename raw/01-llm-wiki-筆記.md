# 課堂筆記：什麼是 LLM Wiki

- 2026 年 4 月，Andrej Karpathy 在 X 上分享他用 LLM 建立個人知識庫的做法，隔天把它整理成一份 GitHub Gist，標題叫「LLM Wiki」。這份 Gist 沒有程式碼，只描述一種做法。
- 一般 RAG 的做法：每次提問時，從原始文件裡找出相關片段再回答，知識不會累積。
- LLM Wiki 的做法：每加入一份資料，就請 LLM 把它整理進一個結構化、互相連結的 Markdown wiki。下次提問時讀的是整理好的 wiki，而不是原始文件。
- 三層架構：
  1. 原始資料（raw）：人收集，LLM 只讀不改。
  2. Wiki：LLM 撰寫和維護的 Markdown 頁面。
  3. Schema：一份規則檔，告訴 LLM wiki 長什麼樣、要怎麼維護。
- 兩個特殊檔案：index.md（目錄）和 log.md（工作紀錄）。
- 三種操作：匯入（ingest）、問答（query）、健檢（lint）。
- Karpathy 的比喻：Obsidian 是 IDE，LLM 是工程師，wiki 是程式碼庫。
- 好的回答也可以存回 wiki 變成新頁面，知識庫會越用越豐富。
