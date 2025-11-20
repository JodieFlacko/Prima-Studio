import React, { useState, useEffect } from 'react';

const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    // Nascondi il cursore di default del browser quando il componente è attivo
    document.body.style.cursor = 'none';

    const move = (e) => { 
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
    
    // Pulizia: ripristina il cursore normale se il componente viene smontato
    return () => {
      document.body.style.cursor = 'auto';
      window.removeEventListener('mousemove', move);
      document.removeEventListener('mouseleave', leave);
      document.removeEventListener('mouseenter', enter);
      window.removeEventListener('mousedown', down);
      window.removeEventListener('mouseup', up);
    };
  }, []);

  // Non renderizzare nulla se non è visibile (es. mouse fuori dalla finestra)
  // O se siamo su dispositivi touch (lo controlliamo con CSS media query 'hidden lg:block')
  if (!visible) return null;

  return (
    <div 
      className={`
        fixed pointer-events-none z-[9999]
        flex items-center justify-center rounded-full
        hidden lg:flex
        transition-[width,height,background-color,border-color] duration-150 ease-out
        ${clicked 
          ? 'w-6 h-6 bg-[#00D9FF] border-transparent mix-blend-normal' 
          : 'w-8 h-8 border border-[#00D9FF] bg-transparent mix-blend-difference'
        }
      `}
      style={{ 
        // Usiamo translate3d per forzare l'accelerazione GPU
        // Sottraiamo metà della larghezza/altezza per centrare il cursore sulla punta del mouse
        transform: `translate3d(${pos.x - (clicked ? 12 : 16)}px, ${pos.y - (clicked ? 12 : 16)}px, 0)`,
        left: 0,
        top: 0,
        willChange: 'transform'
      }}
    >
      {/* Puntino centrale */}
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