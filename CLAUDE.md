# Sistema de Gerenciamento de Conteúdo Headless com ABAC

## Visão Geral do Projeto

Este repositório contém um **Trabalho de Conclusão de Curso (TCC)** desenvolvendo um **CMS Headless (Content Management System)** moderno com sistema avançado de controle de acesso baseado em atributos (ABAC).

**Autor:** Gustavo Medeiros Lima (31466281)
**Curso:** Ciência da Computação
**Instituição:** UDF (Centro Universitário do Distrito Federal)
**Local:** Brasília
**Ano:** 2024

## Objetivo

Desenvolver um sistema de gerenciamento de conteúdo headless que permita a criação, edição e distribuição de conteúdo de forma desacoplada, demonstrando na prática as vantagens arquiteturais desta abordagem moderna em comparação aos CMS tradicionais.

## Problema Abordado

Criar websites interativos com backend representa um dos maiores desafios no desenvolvimento web moderno, exigindo domínio de múltiplas tecnologias e arquiteturas complexas. O projeto busca simplificar este processo através de uma arquitetura headless que separa completamente a gestão de conteúdo de sua apresentação.

## Estrutura do Repositório

```
/workspaces/tcc/
├── src/
│   ├── main.typ                    # Documento principal do TCC (Typst)
│   └── udf-tcc-template/          # Template institucional da UDF
│       └── template.typ
├── refs.yml                        # Referências bibliográficas
├── diagramas/                      # Diagramas de arquitetura e banco de dados
│   ├── Diagrama do sistema.png
│   └── schema_database.png
└── CLAUDE.md                       # Este arquivo
```

## Capitulos

O capitulo um serve como introdução ao projeto.
O capitulo dois serve como referencial teorico, todas as definições de conceitos devem estar aqui. Não se pode adicionar questões de design no capitulo 2.
O capitulo três serve para adicionarmos conceitos proprios e elaborar sobre o design do sistema.

## Referencias

Todas as definições de conceitos e afirmações devem conter referencias.
Caso não haja referencias o suficientes no projeto avise o usuario.

Referencias devem vir de fontes confiaveis, então nada de blogs ou websites de empresas sem projetos open source e auditaveis.

## Componentes Principais

### 1. Documento Acadêmico
O arquivo [src/main.typ](src/main.typ) contém o documento completo do TCC incluindo:
- Definição do problema e objetivos
- Referencial teórico extenso sobre CMS, ABAC, GraphQL e arquiteturas modernas
- Conceito e design detalhado do sistema
- Especificação técnica completa

## Compilação do Documento

O documento principal está escrito em **Typst**, uma linguagem de tipografia moderna. Para compilar:

```bash
typst compile src/main.typ
```

---

**Para informações detalhadas sobre a arquitetura, implementação e fundamentos teóricos, consulte o documento principal em [src/main.typ](src/main.typ).**
