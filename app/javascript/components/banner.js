import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Produtos Orgânicos Fresquinhos", "Mais saúde para sua família"],
    typeSpeed: 50,
    loop: true
  });
}
export { loadDynamicBannerText };