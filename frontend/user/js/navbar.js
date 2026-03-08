(function () {
    const mount = document.getElementById('navbar-mount');
    if (!mount) return;
    const active = mount.dataset.active || '';
    mount.outerHTML = `
    <nav class="navbar">
      <div class="nav-inner">
        <a href="index.html" class="brand">
          <span class="brand-icon">
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
              <circle cx="7" cy="7" r="5.5" stroke="white" stroke-width="1.6"/>
              <path d="M7 3.5v3.5l2.5 1.5" stroke="white" stroke-width="1.6" stroke-linecap="round"/>
            </svg>
          </span>
          Know Before You Go
        </a>
        <div class="nav-links">
          <a href="index.html"      class="nav-link ${active === 'home'       ? 'active' : ''}">Home</a>
          <a href="newsletter.html" class="nav-btn  ${active === 'newsletter' ? 'active-btn' : ''}">Newsletter</a>
        </div>
      </div>
    </nav>`;
})();
