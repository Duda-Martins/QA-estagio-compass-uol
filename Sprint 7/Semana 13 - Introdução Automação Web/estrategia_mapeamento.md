# 🧭 Estratégia de Mapeamento de Elementos

## 🔘 Botões

| Tipo de seletor         | Mapeamento                        |
|-------------------------|-----------------------------------|
| ID (se único)           | N/A                               |
| Seletor customizado     | N/A                               |
| Name (se único)         | N/A                               |
| Class name              | `[class='button']`<br>`[class='button alert']`<br>`[class='button success']` |
| CSS combinados          | Não verificado                    |
| XPath sem texto         | Não verificado                    |
| Links (por atributos)   | Não verificado                    |
| XPath com texto/index   | Não verificado                    |

## 📊 Tabela

| Tipo de seletor         | Mapeamento                                                                 |
|-------------------------|----------------------------------------------------------------------------|
| ID (se único)           | N/A                                                                        |
| Seletor customizado     | N/A                                                                        |
| Name (se único)         | N/A                                                                        |
| Class name              | N/A                                                                        |
| CSS combinados          | `table tbody tr:nth-child(1)` – Linha<br>`table thead tr th:nth-child(1)` – Cabeçalho<br>`table tbody tr:nth-child(1) td:nth-child(1)` – Célula específica<br>`table tbody tr:nth-child(1) td a:nth-child(1)` – Edit<br>`table tbody tr:nth-child(1) td a:nth-child(2)` – Delete |
| XPath sem texto         | Não verificado                                                             |
| Links (por atributos)   | Não verificado                                                             |
| XPath com texto/index   | Não verificado                                                             |
