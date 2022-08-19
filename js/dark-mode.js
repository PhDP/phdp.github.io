function setDarkMode(dark, preference) {
    if (dark) {
        preference !== "dark" ? localStorage.setItem('theme', 'dark') : localStorage.removeItem('theme');
        document.documentElement.classList.add('dark');
    } else if (!dark) {
        preference !== "light" ? localStorage.setItem('theme', 'light') : localStorage.removeItem('theme');
        document.documentElement.classList.remove('dark');
    }
};
const preference = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
if (localStorage.getItem('theme') === "dark" || (!('theme' in localStorage) && preference === 'dark')) {
    setDarkMode(true, preference);
}
window.onload = function () {
    document.getElementById('button-dark-mode').addEventListener('click', function() {
        setDarkMode(!document.documentElement.classList.contains('dark'), preference);
    });
};

