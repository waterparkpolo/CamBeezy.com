// Footer year
const yearEl = document.getElementById("year");
if (yearEl) yearEl.textContent = new Date().getFullYear();

// "Last updated" (uses the file's modified time as seen by the browser)
const lastUpdatedEl = document.getElementById("lastUpdated");
if (lastUpdatedEl) {
  const d = new Date(document.lastModified);
  lastUpdatedEl.textContent = d.toLocaleDateString(undefined, {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
}
