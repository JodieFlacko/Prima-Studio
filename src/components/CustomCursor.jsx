import React, { useState, useEffect } from 'react';

const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const move = (e) => { setPos({ x: e.clientX, y: e.clientY }); setVisible(true); };
    const leave = () => setVisible(false);
    window.addEventListener('mousemove', move);
    document.addEventListener('mouseleave', leave);
    return () => { window.removeEventListener('mousemove', move); document.removeEventListener('mouseleave', leave); };
  }, []);

  if (!visible) return null;
  return (
    <div className="fixed top-0 left-0 w-8 h-8 border border-[#00D9FF] rounded-full pointer-events-none z-[9999] -translate-x-1/2 -translate-y-1/2 hidden lg:block transition-opacity duration-300" style={{ left: pos.x, top: pos.y }}>
      <div className="absolute top-1/2 left-1/2 w-1 h-1 bg-white rounded-full -translate-x-1/2 -translate-y-1/2" />
    </div>
  );
};
export default CustomCursor;
