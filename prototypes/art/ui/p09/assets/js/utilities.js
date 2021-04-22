function removeClassByPrefix(el, prefix) {
    var regx = new RegExp('\\b' + prefix + '.*?\\b', 'g');
    el.className = el.className.replace(regx, '');
    return el;
}