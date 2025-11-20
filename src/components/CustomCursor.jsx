import React, { useState, useEffect } from 'react';
const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);
  const [clicked, setClicked] = useState(false);
  useEffect(() => {
    const move = (e) => { setPos({ x: e.clientX, y: e.clientY }); setVisible(true); };
    const leave = () => setVisible(false);
    const down = () => setClicked(true);
    const up = () => setClicked(false);
    window.addEventListener('mousemove', move); document.addEventListener('mouseleave', leave); window.addEventListener('mousedown', down); window.addEventListener('mouseup', up);
    return () => { window.removeEventListener('mousemove', move); document.removeEventListener('mouseleave', leave); window.removeEventListener('mousedown', down); window.removeEventListener('mouseup', up); };
  }, []);
  if (!visible) return null;
  return (
    <div className={`fixed top-0 left-0 pointer-events-none z-[9999] -translate-x-1/2 -translate-y-1/2 hidden lg:flex items-center justify-center rounded-full transition-[transform,background-color,border-color] duration-150 ease-out ${clicked ? 'w-6 h-6 bg-[#00D9FF] border-transparent scale-90' : 'w-8 h-8 border border-[#00D9FF] bg-transparent scale-100'}`} style={{ left: pos.x, top: pos.y }}>
      <div className={`w-1 h-1 bg-white rounded-full transition-opacity duration-150 ${clicked ? 'opacity-0' : 'opacity-100'}`} />
    </div>
  );
};
export default CustomCursor;
