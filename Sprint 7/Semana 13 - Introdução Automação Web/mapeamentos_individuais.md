# 🧭 Estratégia de Mapeamento de Elementos

## 🔘 Visão Geral da Estratégia

Durante o mapeamento dos elementos das páginas **Livelo**, **Divvinhos** e **Google**, adotei uma abordagem baseada em **robustez, manutenção e estabilidade** dos seletores. O objetivo principal foi identificar elementos **fixos e estáveis**, que **não mudem com o tempo** mesmo com atualizações na interface, garantindo que os testes automatizados **não quebrem** com pequenas alterações estruturais.

Para isso, segui a **ordem preferencial de mapeamento de elementos**, priorizando seletores mais confiáveis.

---

## 🔧 Princípios Aplicados
- **Evitar atributos dinâmicos**.
- **Priorizar seletores estruturais e estáticos**, como hierarquias IDs e classes.

---

## Livelo

### 🔘 Carrinho

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | `l-cart__button` – ID único e estável, ideal para testes automatizados.   |
| Seletor customizado     | Não Testado                                                                |
| Name (se único)         | Não Testado                                                                |
| Class name              | Não Testado                                                                |
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

### 🔘 Botão login

| Tipo de seletor         | Mapeamento                                                                         |
|-------------------------|------------------------------------------------------------------------------------|
| ID (se único)           | `l-header__button_login` – ID confiável, com nomenclatura coerente.                |
| Seletor customizado     | Não Testado                                                                        |
| Name (se único)         | Não Testado                                                                        |
| Class name              | Não Testado                                                                        |
| CSS combinados          | Não Testado                                                                        |
| XPath sem texto         | Não Testado                                                                        |
| Links (por atributos)   | Não Testado                                                                        |
| XPath com texto/index   | Não Testado                                                                        |

### 🔘 Botão cadastro

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | `l-header__button_register` – ID claro e aderente à função do botão.       |
| Seletor customizado     | Não Testado                                                                |
| Name (se único)         | Não Testado                                                                |
| Class name              | Não Testado                                                                |
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

---

## Divvinhos

### 🔘 Array de botões de categorias

| Tipo de seletor         | Mapeamento                                                                                   |
|-------------------------|---------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                              |
| Seletor customizado     | N/A                                                              |
| Name (se único)         | N/A                                                              |
| Class name              | `vtex-menu-2-x-menuContainer [...]` – Classe descritiva da VTEX, indicando menu estruturado.   |
| CSS combinados          | Não Testado                                                                                    |
| XPath sem texto         | Não Testado                                                                                    |
| Links (por atributos)   | Não Testado                                                                                    |
| XPath com texto/index   | Não Testado                                                                                    |

### 🔘 Array de produtos

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | `#slider-items-32v71aa` – ID funcional para o carrossel de produtos.       |
| Seletor customizado     | Não Testado                                                                |
| Name (se único)         | Não Testado                                                                |
| Class name              | Não Testado                                                                |
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

### 🔘 Lupa

| Tipo de seletor         | Mapeamento                                                                                                  |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                         |
| Seletor customizado     | N/A                                                                                                         |
| Name (se único)         | N/A                                                                                                         |
| Class name              | `vtex-store-components-3-x-searchBarIcon [...]` – Classe padronizada e semântica para o ícone de busca.     |
| CSS combinados          | Não Testado                                                                                                 |
| XPath sem texto         | Não Testado                                                                                                 |
| Links (por atributos)   | Não Testado                                                                                                 |
| XPath com texto/index   | Não Testado                                                                                                 |

### 🔘 Carrinho

| Tipo de seletor         | Mapeamento                                                                                          |
|-------------------------|-----------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                 |
| Seletor customizado     | N/A                                                                                                 |
| Name (se único)         | N/A                                                                                                 |
| Class name              | `divvino-minicart-2-x-minicartIconContainer [...]` – Classe clara ligada ao ícone de minicarrinho. |
| CSS combinados          | Não Testado                                                                                         |
| XPath sem texto         | Não Testado                                                                                         |
| Links (por atributos)   | Não Testado                                                                                         |
| XPath com texto/index   | Não Testado                                                                                         |

---

## Google

### 🔘 Campo de busca

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                        |
| Seletor customizado     | N/A                                                                        |
| Name (se único)         | N/A                                                                        |
| Class name              | `.gLFyf` – Classe altamente estável e amplamente usada para o campo de busca.|
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

### 🔘 Botão 'Pesquisa Google'

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                        |
| Seletor customizado     | N/A                                                                        |
| Name (se único)         | N/A                                                                        |
| Class name              | `.gNO89b` – Classe exclusiva do botão de pesquisa do Google.               |
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

### 🔘 Array de links

| Tipo de seletor         | Mapeamento                                                                   |
|-------------------------|------------------------------------------------------------------------------|
| ID (se único)           | `#rso` – ID fixo do contêiner principal de resultados de busca.             |
| Seletor customizado     | Não Testado                                                                  |
| Name (se único)         | Não Testado                                                                  |
| Class name              | Não Testado                                                                  |
| CSS combinados          | Não Testado                                                                  |
| XPath sem texto         | Não Testado                                                                  |
| Links (por atributos)   | Não Testado                                                                  |
| XPath com texto/index   | Não Testado                                                                  |


---

# 📌 Considerações Finais
Essa abordagem buscou garantir a **manutenção a longo prazo** dos testes automatizados, usando seletores que resistem a mudanças sutis no HTML. A aplicação da **ordem preferencial de seletores** foi essencial para alcançar esse objetivo com consistência.

Com isso, estabelecemos uma base sólida para automação confiável e evolutiva.

---

# 🛒 Site da Mercado Livre (Utilizando todas as estratégias aprendidas)

## Botão carrinho

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | `#nav-cart` – ID único e descritivo, estável para ações no carrinho.       |
| Seletor customizado     | Não Testado                                                                |
| Name (se único)         | Não Testado                                                                |
| Class name              | Não Testado                                                                |
| CSS combinados          | Não Testado                                                                |
| XPath sem texto         | Não Testado                                                                |
| Links (por atributos)   | Não Testado                                                                |
| XPath com texto/index   | Não Testado                                                                |

## Botão "entre"

| Tipo de seletor         | Mapeamento                                                                                  |
|-------------------------|---------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                         |
| Seletor customizado     | `[data-link-id="login"]` – Atributo `data-*` exclusivo para login, robusto e semântico.     |
| Name (se único)         | Não Testado                                                                                 |
| Class name              | Não Testado                                                                                 |
| CSS combinados          | Não Testado                                                                                 |
| XPath sem texto         | Não Testado                                                                                 |
| Links (por atributos)   | Não Testado                                                                                 |
| XPath com texto/index   | Não Testado                                                                                 |

## Input de pesquisa

| Tipo de seletor         | Mapeamento                                                                             |
|-------------------------|----------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                    |
| Seletor customizado     | N/A                                                                                    |
| Name (se único)         | `[name="as_word"]` – Seletor por atributo `name`, confiável e presente em formulários. |
| Class name              | Não Testado                                                                            |
| CSS combinados          | Não Testado                                                                            |
| XPath sem texto         | Não Testado                                                                            |
| Links (por atributos)   | Não Testado                                                                            |
| XPath com texto/index   | Não Testado                                                                            |

## Primeira recomendação de oferta do dia

| Tipo de seletor         | Mapeamento                                                                                           |
|-------------------------|------------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                  |
| Seletor customizado     | N/A                                                                                                  |
| Name (se único)         | N/A                                                                                                  |
| Class name              | `.ui-recommendations-carousel-dual__first-card` – Classe semântica específica da primeira oferta.    |
| CSS combinados          | Não Testado                                                                                          |
| XPath sem texto         | Não Testado                                                                                          |
| Links (por atributos)   | Não Testado                                                                                          |
| XPath com texto/index   | Não Testado                                                                                          |

## Logo

| Tipo de seletor         | Mapeamento                                                                                                       |
|-------------------------|------------------------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                              |
| Seletor customizado     | N/A                                                                                                              |
| Name (se único)         | N/A                                                                                                              |
| Class name              | N/A                                                                                                              |
| CSS combinados          | `[class="nav-header-plus-logo nav-area nav-top-area nav-left-area"]` – Composição CSS detalhada do container.    |
| XPath sem texto         | Não Testado                                                                                                     |
| Links (por atributos)   | Não Testado                                                                                                     |
| XPath com texto/index   | Não Testado                                                                                                     |

## Botão "crie sua conta"

| Tipo de seletor         | Mapeamento                                                                                     |
|-------------------------|------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                            |
| Seletor customizado     | N/A                                                                                            |
| Name (se único)         | N/A                                                                                            |
| Class name              | N/A                                                                                            |
| CSS combinados          | N/A                                                                                            |
| XPath sem texto         | `//*[@id="nav-header-menu"]/ul/li[1]/a` – XPath baseado na estrutura de lista principal.        |
| Links (por atributos)   | Não Testado                                                                                    |
| XPath com texto/index   | Não Testado                                                                                    |

## Botão "entre" (alternativa via link)

| Tipo de seletor         | Mapeamento                                                                                                                                            |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                                                                   |
| Seletor customizado     | N/A                                                                                                                                                   |
| Name (se único)         | N/A                                                                                                                                                   |
| Class name              | N/A                                                                                                                                                   |
| CSS combinados          | N/A                                                                                                                                                   |
| XPath sem texto         | N/A                                                                                                                                                   |
| Links (por atributos)   | `[href="https://www.mercadolivre.com/jms/mlb/lgz/login?..."]` – Link completo com URL de login explícita.                          |
| XPath com texto/index   | Não Testado                                                                                                                                           |

## Botão "Entrar na sua conta" do card "Entre na sua conta"

| Tipo de seletor         | Mapeamento                                                                                          |
|-------------------------|-----------------------------------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                                                 |
| Seletor customizado     | N/A                                                                                                 |
| Name (se único)         | N/A                                                                                                 |
| Class name              | N/A                                                                                                 |
| CSS combinados          | N/A                                                                                                 |
| XPath sem texto         | N/A                                                                                                 |
| Links (por atributos)   | N/A                                                                                                 |
| XPath com texto/index   | `//a[text()="Entrar na sua conta"]` – XPath direto com base no texto visível do link de ação.       |
