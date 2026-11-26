(() => {
  "use strict";

  const CONFIG_URL = "./curriculum.json";
  const STORAGE_KEY = "cloud-academy-progress-v1";
  const state = {
    curriculum: null,
    weekIndex: 0,
    activeTab: "notes",
    activeDay: 1,
    progress: loadProgress(),
    searchTerm: ""
  };

  const $ = (selector) => document.querySelector(selector);
  const $$ = (selector) => [...document.querySelectorAll(selector)];

  function loadProgress() {
    try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) || { completed: {} }; }
    catch { return { completed: {} }; }
  }
  function saveProgress() {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state.progress));
    updateProgressUI();
  }
  function keyFor(week, item) { return `w${week}:${item}`; }
  function isDone(week, item) { return Boolean(state.progress.completed[keyFor(week, item)]); }
  function setDone(week, item, checked) {
    const key = keyFor(week, item);
    if (checked) state.progress.completed[key] = true;
    else delete state.progress.completed[key];
    saveProgress();
  }
  function allMilestones() {
    // Seven day checkboxes and one weekly assignment per week.
    return state.curriculum.weeks.length * 8;
  }
  function weekDoneCount(week) {
    let n = 0;
    for (let d = 1; d <= 7; d++) if (isDone(week.week, `day${d}`)) n++;
    if (isDone(week.week, "assignment")) n++;
    return n;
  }
  function updateProgressUI() {
    if (!state.curriculum) return;
    const total = allMilestones();
    const done = Object.values(state.progress.completed).filter(Boolean).length;
    const pct = total ? Math.round(done / total * 100) : 0;
    $("#overallPercent").textContent = `${pct}%`;
    $("#completedCount").innerHTML = `${done} <span class="stat-muted">/ ${total}</span>`;
    $("#mainProgress").style.width = `${pct}%`;
    $("#sidebarPercent").textContent = `${pct}%`;
    $("#sidebarProgress").style.width = `${pct}%`;
    $("#sidebarProgressMeta").textContent = `${done} of ${total} milestones completed`;
    const firstIncomplete = state.curriculum.weeks.find(w => weekDoneCount(w) < 8) || state.curriculum.weeks[0];
    $("#currentFocus").textContent = `Week ${String(firstIncomplete.week).padStart(2, "0")}`;
    $("#currentFocusTitle").textContent = firstIncomplete.title;
    const current = currentWeek();
    const wp = Math.round(weekDoneCount(current) / 8 * 100);
    $("#weekPercent").textContent = `${wp}%`;
    $("#weekProgress").style.width = `${wp}%`;
    renderDayList();
    renderNavigation();
  }
  function currentWeek() { return state.curriculum.weeks[state.weekIndex]; }

  function renderNavigation() {
    const nav = $("#curriculumNav");
    if (!state.curriculum) return;
    const query = state.searchTerm.toLowerCase();
    nav.innerHTML = "";
    state.curriculum.modules.forEach(module => {
      const weeks = state.curriculum.weeks.filter(w => w.moduleId === module.id);
      const matching = weeks.filter(w => !query || `${module.title} ${w.title} ${w.summary}`.toLowerCase().includes(query));
      if (query && !matching.length) return;
      const details = document.createElement("details");
      details.className = "module-group";
      details.open = query ? true : weeks.some(w => w.week === currentWeek().week);
      const summary = document.createElement("summary");
      summary.className = "module-summary";
      const pct = Math.round(weeks.reduce((sum, w) => sum + weekDoneCount(w), 0) / (weeks.length * 8) * 100);
      summary.innerHTML = `<span class="module-chevron">›</span><span class="module-number">${String(module.startWeek).padStart(2,"0")}</span><span class="module-name">${escapeHTML(module.title)}</span><span class="module-pct">${pct}%</span>`;
      details.appendChild(summary);
      const list = document.createElement("div");
      list.className = "module-weeks";
      matching.forEach(week => {
        const button = document.createElement("button");
        button.className = `week-nav-item ${week.week === currentWeek().week ? "selected" : ""}`;
        button.innerHTML = `<span class="week-nav-num">${String(week.week).padStart(2,"0")}</span><span class="week-nav-title">${escapeHTML(week.title)}</span><span class="week-nav-check">${weekDoneCount(week) === 8 ? "✓" : ""}</span>`;
        button.addEventListener("click", () => selectWeek(week.week));
        list.appendChild(button);
      });
      details.appendChild(list);
      nav.appendChild(details);
    });
    if (!nav.children.length) nav.innerHTML = `<div class="empty-search">No matching weeks found.</div>`;
  }

  function renderDayList() {
    if (!state.curriculum) return;
    const week = currentWeek();
    const list = $("#dayList");
    list.innerHTML = "";
    week.days.forEach(day => {
      const button = document.createElement("button");
      button.className = `day-item ${day.day === state.activeDay ? "active" : ""}`;
      button.innerHTML = `<span class="day-check ${isDone(week.week, `day${day.day}`) ? "checked" : ""}">${isDone(week.week, `day${day.day}`) ? "✓" : String(day.day).padStart(2,"0")}</span><span class="day-copy"><strong>Day ${String(day.day).padStart(2,"0")}</strong><small>${escapeHTML(day.title || "Study & practice")}</small></span><span class="day-arrow">›</span>`;
      button.addEventListener("click", () => { state.activeDay = day.day; renderDayList(); renderResource(); });
      list.appendChild(button);
    });
  }

  function selectWeek(weekNumber) {
    const index = state.curriculum.weeks.findIndex(w => w.week === weekNumber);
    if (index < 0) return;
    state.weekIndex = index;
    state.activeDay = 1;
    state.activeTab = "notes";
    $$(".tab-btn").forEach(btn => {
      const active = btn.dataset.tab === state.activeTab;
      btn.classList.toggle("active", active);
      btn.setAttribute("aria-selected", String(active));
    });
    renderWeek();
    $("#sidebar").classList.remove("mobile-open");
  }
  function renderWeek() {
    const week = currentWeek();
    $("#moduleEyebrow").textContent = `${week.moduleId.replace("module-", "MODULE ").toUpperCase()} · ${week.moduleTitle}`;
    $("#weekTitle").textContent = week.title;
    $("#weekSummary").textContent = week.summary || "Learn, practice and review this week's material.";
    $("#weekLabel").textContent = `WEEK ${String(week.week).padStart(2,"0")} / 32`;
    renderNavigation();
    renderDayList();
    updateProgressUI();
    renderResource();
    $("#prevWeek").disabled = state.weekIndex === 0;
    $("#nextWeek").disabled = state.weekIndex === state.curriculum.weeks.length - 1;
  }

  function activeResource() {
    const week = currentWeek();
    const day = week.days.find(d => d.day === state.activeDay);
    if (state.activeTab === "notes") return { path: day.notes, label: `DAY ${String(day.day).padStart(2,"0")} · NOTES`, title: day.title || `Day ${day.day} notes`, ext: ".md" };
    if (state.activeTab === "labs") return { path: day.lab, label: `DAY ${String(day.day).padStart(2,"0")} · LAB`, title: day.title || `Day ${day.day} lab`, ext: extension(day.lab) };
    return { path: day.assignment || week.weeklyAssignment, label: `WEEK ${String(week.week).padStart(2,"0")} · ASSIGNMENTS`, title: "Assignments & assessments", ext: ".md" };
  }
  function extension(path = "") { return path.match(/\.[a-z0-9]+$/i)?.[0] || ".txt"; }

  async function renderResource() {
    const week = currentWeek();
    const resource = activeResource();
    $("#resourceKind").textContent = resource.label;
    $("#resourceTitle").textContent = resource.title;
    $("#resourceFile").textContent = resource.ext;
    const body = $("#resourceBody");
    body.innerHTML = `<div class="loading-state">Loading <code>${escapeHTML(resource.path)}</code>…</div>`;

    if (state.activeTab === "assignments") {
      body.innerHTML = "";
      const assignmentDone = isDone(week.week, "assignment");
      const assignment = createResourceCard("Weekly assignment", week.weeklyAssignment, "assignment");
      const assessment = createResourceCard("Weekly assessment", week.assessment, "assessment");
      const project = createResourceCard("Project / practical deliverable", week.project, "project");
      body.append(assignment, assessment, project);
      const check = document.createElement("label");
      check.className = "assignment-complete";
      check.innerHTML = `<input type="checkbox" ${assignmentDone ? "checked" : ""}><span class="custom-check"></span><span><strong>Mark weekly assignment complete</strong><small>Saved automatically in this browser</small></span>`;
      check.querySelector("input").addEventListener("change", e => setDone(week.week, "assignment", e.target.checked));
      body.append(check);
      return;
    }

    try {
      const response = await fetch(resource.path, { cache: "no-store" });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const source = await response.text();
      if (state.activeTab === "notes" || extension(resource.path) === ".md") {
        body.innerHTML = marked.parse(source);
        enhanceCodeBlocks(body);
      } else {
        body.innerHTML = `<pre class="code-file"><code class="language-${languageFor(resource.path)}">${escapeHTML(source)}</code></pre>`;
        if (window.hljs) body.querySelectorAll("pre code").forEach(block => hljs.highlightElement(block));
        addCopyButtons(body);
      }
    } catch (error) {
      body.innerHTML = `<div class="empty-state"><div class="empty-icon">⌁</div><h3>Content not added yet</h3><p>This resource is mapped in <code>curriculum.json</code>, but the file isn't available yet.</p><div class="missing-path">${escapeHTML(resource.path)}</div><p class="text-xs text-zinc-500">Create this file at the path above. It will load automatically when you refresh this page.</p></div>`;
    }
  }

  function createResourceCard(title, path, type) {
    const card = document.createElement("div");
    card.className = "assignment-resource";
    card.innerHTML = `<div class="flex items-start justify-between gap-3"><div><h4>${escapeHTML(title)}</h4><p class="resource-path">${escapeHTML(path || "Not configured")}</p></div><span class="file-chip">${extension(path)}</span></div><button class="load-resource-btn">Open resource <span>→</span></button>`;
    card.querySelector("button").addEventListener("click", () => loadStandaloneMarkdown(path, title));
    return card;
  }
  async function loadStandaloneMarkdown(path, title) {
    const body = $("#resourceBody");
    $("#resourceTitle").textContent = title;
    $("#resourceFile").textContent = extension(path);
    body.innerHTML = `<div class="loading-state">Loading resource…</div>`;
    try {
      const response = await fetch(path, { cache: "no-store" });
      if (!response.ok) throw new Error("Not found");
      body.innerHTML = marked.parse(await response.text());
      enhanceCodeBlocks(body);
    } catch {
      body.innerHTML = `<div class="empty-state"><h3>Resource not added yet</h3><p>Create this file to make it available:</p><div class="missing-path">${escapeHTML(path)}</div></div>`;
    }
  }

  function enhanceCodeBlocks(container) {
    if (window.hljs) container.querySelectorAll("pre code").forEach(block => {
      try { hljs.highlightElement(block); } catch {}
    });
    addCopyButtons(container);
  }
  function addCopyButtons(container) {
    container.querySelectorAll("pre").forEach(pre => {
      if (pre.querySelector(".copy-code-btn")) return;
      const code = pre.querySelector("code");
      if (!code) return;
      const button = document.createElement("button");
      button.className = "copy-code-btn";
      button.type = "button";
      button.textContent = "Copy";
      button.addEventListener("click", async () => {
        try {
          await navigator.clipboard.writeText(code.innerText);
          button.textContent = "Copied!";
          showToast("Code copied to clipboard");
          setTimeout(() => button.textContent = "Copy", 1400);
        } catch { showToast("Clipboard unavailable — select and copy the code manually"); }
      });
      pre.appendChild(button);
    });
  }
  function languageFor(path) {
    const ext = extension(path);
    return ({".sh":"bash",".py":"python",".sql":"sql",".json":"json",".yml":"yaml",".yaml":"yaml",".tf":"hcl" })[ext] || "plaintext";
  }
  function escapeHTML(value) {
    return String(value ?? "").replace(/[&<>"']/g, char => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" }[char]));
  }
  let toastTimer;
  function showToast(message) {
    const toast = $("#toast");
    toast.textContent = message;
    toast.classList.add("show");
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => toast.classList.remove("show"), 2200);
  }

  function bindEvents() {
    $$(".tab-btn").forEach(btn => btn.addEventListener("click", () => {
      state.activeTab = btn.dataset.tab;
      $$(".tab-btn").forEach(tab => {
        const active = tab === btn;
        tab.classList.toggle("active", active);
        tab.setAttribute("aria-selected", String(active));
      });
      renderResource();
    }));
    $("#prevWeek").addEventListener("click", () => selectWeek(currentWeek().week - 1));
    $("#nextWeek").addEventListener("click", () => selectWeek(currentWeek().week + 1));
    $("#sidebarToggle").addEventListener("click", () => $("#sidebar").classList.toggle("mobile-open"));
    $("#searchInput").addEventListener("input", e => {
      state.searchTerm = e.target.value.trim();
      renderNavigation();
    });
    document.addEventListener("keydown", e => {
      if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === "k") {
        e.preventDefault(); $("#searchInput").focus();
      }
      if (e.key === "Escape") {
        $("#searchInput").blur(); $("#sidebar").classList.remove("mobile-open");
      }
    });
  }

  async function init() {
    bindEvents();
    try {
      const response = await fetch(CONFIG_URL, { cache: "no-store" });
      if (!response.ok) throw new Error("Could not load curriculum.json");
      state.curriculum = await response.json();
      if (!Array.isArray(state.curriculum.weeks) || !Array.isArray(state.curriculum.modules)) throw new Error("Invalid curriculum structure");
      $("#weekCount").textContent = `${state.curriculum.weeks.length} WEEKS`;
      const initial = state.curriculum.weeks.findIndex(w => weekDoneCount(w) < 8);
      state.weekIndex = Math.max(0, initial);
      renderWeek();
    } catch (error) {
      $("#curriculumNav").innerHTML = `<div class="empty-state"><h3>Unable to load curriculum</h3><p>Check that you're serving the repository through a local HTTP server and that <code>curriculum.json</code> is in the root folder.</p></div>`;
      $("#weekTitle").textContent = "Curriculum unavailable";
      console.error(error);
    }
  }

  document.addEventListener("DOMContentLoaded", init);
})();