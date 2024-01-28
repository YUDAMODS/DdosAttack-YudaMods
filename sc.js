function tombol(){
  Tombol.style="opacity:1;transform: scale(1);margin-top:15px";
  if(jikatom==0){ftom=1;}
  if(jikatom==1){tmbl.innerHTML=tmbl2.innerHTML;ftom=2;}
}
  
function multifungsi(){
  if(ftom==1){dilanjut();}
  if(ftom==2){dibalas();}
  if(ftom==5){menuju();}
}
  
function stakhir(){tmbl.innerHTML="Kirim";Tombol.style="opacity:1;transform: scale(1)";ftom=5;fungsi=0;}

async function dibalas(){
  setInterval(createHeart,200);
  wallpaper.style="transform: scale(1)";
  Tombol.style="opacity:0;transform: scale(.1);";
  Content.style = "transition:all 1s ease;opacity:1;margin-top:7vh;";
  jawab();
}

async function jawab(){
  var { value: jawaban } = await swals.fire({
    title: 'Tulis Pesan &#128073;&#128072;', input: 'text', allowOutsideClick: false, showCancelButton: false,
  });
  if(jawaban && jawaban.length < 19){
    window.jawaban = jawaban;
    pesanwhatsapp = jawaban;
    balasan = jawaban;
    otomatis3();setTimeout(stakhir,1000);
  } else {
    await swals.fire('Ups!', 'Jawaban tidak boleh kosong atau lebih dari 18 karakter, ya!');jawab();
  }
}