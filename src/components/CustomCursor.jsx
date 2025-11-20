import React, { useState, useEffect } from 'react';

const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    // 1. Nascondi il cursore di default in modo aggressivo
    const style = document.createElement('style');
    style.innerHTML = `
      * { cursor: none !important; }
      body, html { cursor: none !important; }
    `;
    style.id = 'cursor-style';
    document.head.appendChild(style);

    const move = (e) => {
      // Aggiornamento posizione immediato
      setPos({ x: e.clientX, y: e.clientY });
      setVisible(true);
    };
    
    const leave = () => setVisible(false);
    const enter = () => setVisible(true);
    const down = () => setClicked(true);
    const up = () => setClicked(false);
    
    window.addEventListener('mousemove', move);
    document.addEventListener('mouseleave', leave);
    document.addEventListener('mouseenter', enter);
    window.addEventListener('mousedown', down);
    window.addEventListener('mouseup', up);
    
    // Pulizia
    return () => {
      const existingStyle = document.getElementById('cursor-style');
      if (existingStyle) existingStyle.remove();
      
      window.removeEventListener('mousemove', move);
      document.removeEventListener('mouseleave', leave);
      document.removeEventListener('mouseenter', enter);
      window.removeEventListener('mousedown', down);
      window.removeEventListener('mouseup', up);
    };
  }, []);

  if (!visible) return null;

  // Calcolo offset per centrare il cursore
  // w-8 = 32px -> offset 16px
  // w-6 = 24px -> offset 12px
  const offset = clicked ? 12 : 16;

  return (
    <div 
      className={`
        fixed pointer-events-none z-[9999]
        flex items-center justify-center rounded-full
        hidden lg:flex
        /* Transizione SOLO su width, height, colori. MAI su transform o left/top per evitare lag */
        transition-[width,height,background-color,border-color] duration-150 ease-out
        ${clicked 
          ? 'w-6 h-6 bg-[#00D9FF] border-transparent mix-blend-normal' 
          : 'w-8 h-8 border border-[#00D9FF] bg-transparent mix-blend-difference'
        }
      `}
      style={{ 
        left: 0,
        top: 0,
        // Usa translate3d per performance GPU e posizionamento preciso
        transform: `translate3d(${pos.x - offset}px, ${pos.y - offset}px, 0)`,
        willChange: 'transform, width, height'
      }}
    >
      {/* Puntino centrale (visibile solo quando non cliccato) */}
      <div 
        className={`
          w-1 h-1 bg-white rounded-full 
          transition-opacity duration-150
          ${clicked ? 'opacity-0' : 'opacity-100'}
        `} 
      />
    </div>
  );
};

export default CustomCursor;