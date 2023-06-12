const rootEl = document.documentElement;
window.setInterval(setTime, 1000);

function setTime() {
  const ticker = new Date();
  const hrs = ticker.getHours();
  const min = ticker.getMinutes();
  const ampm = hrs >= 12 ? 'AM' : 'PM';
  const timeEl = document.querySelector('time');
  // timeEl.textContent = `${hrs > 12 ? hrs - 12 : hrs}:${`${min}`.padStart(2, '0')} ${ampm}`;
  // timeEl.dateTime = `${hrs}:${min}`;
}

const iconAreaEl = document.querySelector('.icons');
const icon = document.querySelector('.icon');

let iconAreaBounds, mouseDown, movingElement, iconOffsetX, iconOffsetY;

icon.addEventListener('click', evt => {

  console.log("hi", evt)
  // movingElement = null;
  window.location.href = "https://www.google.com"
});

iconAreaEl.addEventListener('mouseup', evt => {
  console.log("hi2", evt)
  movingElement = null;
  
});

iconAreaEl.addEventListener('mouseleave', evt => {
  movingElement = null;
});

iconAreaEl.addEventListener('mousemove', evt => {
  evt.preventDefault();

  if (!!movingElement) {
    const x = evt.clientX - iconAreaBounds.left - iconOffsetX;
    const y = evt.clientY - iconAreaBounds.top - iconOffsetY;
    movingElement.style.top = `${y}px`;
    movingElement.style.left = `${x}px`;
  }
});

document.querySelectorAll('.icons li').forEach(el => {
  el.addEventListener('mousedown', evt => {
    iconAreaBounds = iconAreaEl.getBoundingClientRect();
    movingElement = evt.currentTarget;
    const iconBounds = el.getBoundingClientRect();

    iconOffsetX = evt.clientX - iconBounds.left;
    iconOffsetY = evt.clientY - iconBounds.top;
    console.log(evt.clientY, iconAreaBounds.top, iconOffsetY);
    const x = evt.clientX - iconAreaBounds.left - iconOffsetX;
    const y = evt.clientY - iconAreaBounds.top - iconOffsetY;
    movingElement.style.top = `${y}px`;
    movingElement.style.left = `${x}px`;
    el.style.right = 'initial';
    el.style.bottom = 'initial';
  });

  el.addEventListener('dblclick', evt => {
    rootEl.style.setProperty('--color-fore', `hsla(${Math.floor(Math.random() * 360)}, 100%, 50%, 1)`);
  });
});
