#import "./udf-tcc-template/template.typ": *

// Document content
#show: udf-paper.with(
  title: "Desenvolvimento de um Sistema de Gerenciamento de Conteúdo Headless",
  subtitle: "Uma Abordagem Moderna para CMS",
  authors: (
    (name: "Gustavo Medeiros Lima", student-id: "31466281"),
  ),
  course: "Ciência da Computação",
  advisor: "",
  city: "Brasília",
  year: 2024,
  bibliography: "../refs.yml"
)

// ===========================================
// CAPÍTULO 1 - DEFINIÇÃO DO PROBLEMA, OBJETIVOS E METODOLOGIA
// ===========================================

= Introdução

O desenvolvimento de aplicações web modernas que integram conteúdo dinâmico com bancos de dados representa um desafio significativo para desenvolvedores, exigindo domínio de múltiplas tecnologias que abrangem desde a camada de apresentação até a lógica de negócios e persistência de dados. A complexidade aumenta quando consideramos requisitos não-funcionais como performance, responsividade, segurança e controle de acesso granular.
#linebreak()
Este trabalho apresenta o TechtonicCMS, um sistema de gerenciamento de conteúdo headless (CMS Headless) desenvolvido para simplificar este processo através de uma arquitetura desacoplada que separa completamente a gestão de conteúdo de sua apresentação. Ao adotar esta abordagem moderna, o TechtonicCMS permite que desenvolvedores criem interfaces personalizadas enquanto editores de conteúdo mantêm autonomia para gerenciar informações de forma intuitiva, sem necessidade de conhecimento técnico aprofundado.

== Objetivos


Desenvolver um sistema de gerenciamento de conteúdo headless (CMS Headless) que permita a criação, edição e distribuição de conteúdo de forma desacoplada, oferecendo flexibilidade para desenvolvedores criarem interfaces personalizadas enquanto mantém a facilidade de uso para editores de conteúdo, demonstrando na prática as vantagens arquiteturais desta abordagem moderna em comparação aos CMS tradicionais.

=== Objetivos Específicos

1. Desenvolver uma interface administrativa web para facilitar o gerenciamento de conteúdo sem necessidade de ferramentas externas
2. Desenvolver bibliotecas de acesso para facilitar o uso do sistema.

== Metodologia

Este trabalho adota uma abordagem de pesquisa aplicada, combinando fundamentação teórica com desenvolvimento prático de um protótipo funcional. A metodologia está organizada em três etapas complementares:

=== Etapa 1: Pesquisa e Fundamentação Teórica

Revisão bibliográfica de fontes acadêmicas e técnicas sobre CMS, sistemas de controle de acesso (RBAC e ABAC), arquiteturas web modernas e APIs. Análise comparativa de sistemas existentes para identificar padrões e oportunidades de inovação. Especificação dos requisitos funcionais e não-funcionais do sistema.

=== Etapa 2: Design e Modelagem

Modelagem do banco de dados relacional com suporte a schemas dinâmicos. Definição da arquitetura em camadas e especificação das interfaces REST e GraphQL. Projeto do sistema ABAC com suas políticas e regras de autorização.

=== Etapa 3: Implementação e Validação

Desenvolvimento incremental do protótipo em cinco fases:

*Fase 1 - Fundação*: Implementação da infraestrutura base (banco de dados, autenticação e estruturas para schemas dinâmicos).

*Fase 2 - Core*: Desenvolvimento das funcionalidades centrais de gerenciamento de coleções e entradas, incluindo o sistema ABAC.

*Fase 3 - APIs*: Construção das camadas REST e GraphQL com validação e otimização de consultas.

*Fase 4 - Interface*: Desenvolvimento do painel administrativo com formulários dinâmicos baseados nos schemas.

*Fase 5 - Validação*: Testes funcionais, de performance e segurança, seguidos de ajustes baseados nos resultados.

// ================================
// CAPÍTULO 2 - REFERENCIAL TEÓRICO
// ================================

= Referencial Teórico

Este capítulo apresenta o referencial teórico fundamental para compreensão dos conceitos, tecnologias e metodologias empregadas no desenvolvimento do sistema proposto, abrangendo desde fundamentos de CMS tradicionais até arquiteturas headless modernas e sistemas avançados de controle de acesso.

== Sistemas de Gerenciamento de Conteúdo (CMS)

Um Sistema de Gerenciamento de Conteúdo (ou CMS, da sigla em inglês _Content Management System_) é como um painel de controle para gerenciar o conteúdo de um site @zhang2008content. Ele permite que pessoas sem conhecimento técnico possam criar, editar e publicar textos, imagens e vídeos em um site, sem precisar saber programação.

Pense no CMS como um editor de documentos, similar ao Microsoft Word, mas para sites. Em vez de precisar escrever código para adicionar uma nova notícia ou atualizar uma foto, você simplesmente usa uma interface visual, clica em botões e preenche formulários @chen2002study.

=== A Evolução dos CMS

Os CMS passaram por três fases importantes de evolução @chen2002study:
#linebreak()
*Primeira Geração - Sites Estáticos*: No início da internet, qualquer mudança em um site exigia que um programador alterasse o código manualmente. Era como ter que chamar um engenheiro toda vez que você quisesse mudar a cor de uma parede da sua casa @fielding2000architectural.
#linebreak()
*Segunda Geração - CMS Tradicionais*: Surgiram sistemas como WordPress e Joomla, que tornaram a criação de sites muito mais fácil @wordpress2024docs @joomla2024docs. Hoje, o WordPress é usado por mais de 40% de todos os sites do mundo @w3techs2024usage. Esses sistemas são como blocos de montar: você escolhe um tema visual pronto, instala algumas extensões, e tem um site funcionando.
#linebreak()
*Terceira Geração - CMS Headless (Modernos)*: É a fase atual, onde o sistema separa completamente o gerenciamento do conteúdo da apresentação visual @headless2021decoupled. Isso dá muito mais liberdade para os desenvolvedores criarem diferentes tipos de interfaces.

=== Componentes Básicos de um CMS

Todo CMS moderno possui cinco partes essenciais @zhang2008content:

1. *Painel Administrativo*: Onde você cria e edita o conteúdo (textos, imagens, vídeos)
2. *Banco de Dados*: Onde todas as informações são armazenadas de forma organizada
3. *Sistema de Publicação*: Que cuida de mostrar o conteúdo para os visitantes
4. *Controle de Acesso*: Que define quem pode ver ou editar cada coisa
5. *Conexões com Outros Sistemas*: Para integrar com redes sociais, sistemas de pagamento, etc.

=== Três Tipos de CMS

Hoje existem três categorias principais de CMS @headless2021decoupled:
#linebreak()
*CMS Tradicionais*: Como o WordPress, onde tudo vem junto em um pacote único @wordpress2024docs. São fáceis de usar e instalar, mas têm limitações quando você precisa de algo mais personalizado ou quando o site cresce muito.
#linebreak()
*CMS _Headless_ (Desacoplados)*: Separam o gerenciamento de conteúdo da apresentação visual @contentful2024headless. É como ter uma biblioteca central de conteúdo que pode alimentar simultaneamente seu site, aplicativo de celular e até assistentes de voz. Oferece muito mais flexibilidade, mas é mais complexo de configurar.
#linebreak()
*CMS Híbridos*: Combinam as duas abordagens @strapi2024docs, permitindo usar o sistema da forma tradicional ou moderna, conforme a necessidade do projeto.

== Arquitetura _Headless_: Separando a "Cabeça" do "Corpo"

Antes de entender a arquitetura headless, é importante conhecer dois conceitos fundamentais da arquitetura web @fielding2000architectural:
#linebreak()
*_Backend_ (Retaguarda)*: É a parte "invisível" do sistema que fica no servidor. Inclui o banco de dados onde as informações são armazenadas, a lógica de negócios que processa os dados, e o sistema de segurança que controla quem pode acessar o quê. É como os bastidores de um teatro - o público não vê, mas é onde todo o trabalho acontece.
#linebreak()
*_Frontend_ (Interface)*: É a parte visual que o usuário vê e interage - a interface gráfica, os botões, formulários e menus. Executa no navegador do usuário (Chrome, Firefox, Safari) e se comunica com o backend para buscar ou enviar dados. É como o palco do teatro onde a apresentação acontece.

=== O Que É um CMS _Headless_
#linebreak()
Imagine que um site tradicional é como um boneco de ação: a cabeça (a parte visual que as pessoas veem) está permanentemente grudada no corpo (o banco de dados e a lógica). Se você quiser trocar apenas a cabeça, precisa desmontar tudo @wordpress2024docs.
#linebreak()
Um CMS _Headless_ é diferente: a "cabeça" (_frontend_ - a interface visual) está completamente separada do "corpo" (_backend_ - onde os dados ficam) @headless2021decoupled. Eles conversam através de uma ponte chamada API (_Application Programming Interface_ - Interface de Programação de Aplicações). É como ter peças de LEGO que se encaixam mas podem ser trocadas independentemente @contentful2024headless.

=== _API-First_: Construindo Pela Ponte de Comunicação

O conceito "_API-first_" significa que, ao construir o sistema, a primeira coisa que criamos é essa "ponte de comunicação" (a API) @fielding2000architectural. É como construir primeiro as estradas antes de construir as cidades - garante que tudo possa se conectar bem depois.
#linebreak()
Essa abordagem permite o "_Content as a Service_" (CaaS), ou "Conteúdo como Serviço" @contentful2024headless. Pense no conteúdo como água em uma caixa d'água central: você pode conectar vários canos (sites, apps, dispositivos) nessa mesma fonte. Um único conteúdo alimenta múltiplas saídas.

=== Vantagens da Arquitetura _Headless_

*Liberdade Tecnológica*: Você pode usar as melhores ferramentas para cada parte @headless2021decoupled. Diferentes tecnologias de interface podem coexistir - site, aplicativo móvel e painel administrativo podem usar tecnologias distintas, mas todos consomem os mesmos dados do backend.
#linebreak()
*Escalabilidade Independente*: Se o site está recebendo muito tráfego, você pode aumentar apenas os recursos do frontend. Se precisa processar mais conteúdo, aumenta apenas o backend @kleppmann2017designing. É como poder expandir cômodos específicos da casa sem mexer nos outros.
#linebreak()
*Reutilização Máxima de Conteúdo*: Escreva um conteúdo uma vez, use em todos os lugares @contentful2024headless. O mesmo artigo pode aparecer no site, no aplicativo de celular, em assistentes de voz (como Alexa), em smartwatches, em telas de aeroporto - tudo automaticamente.
#linebreak()
*Estratégia _Omnichannel_*: _Omnichannel_ significa "todos os canais" @headless2021decoupled. Você oferece uma experiência unificada para seus usuários em qualquer plataforma que eles escolham usar.

=== Desafios da Arquitetura _Headless_

Nem tudo são flores. A arquitetura _headless_ traz alguns desafios @contentful2024headless:
#linebreak()
*Exige Mais Conhecimento Técnico*: Para usar um WordPress você pode aprender na hora @wordpress2024docs. Para um sistema headless, você precisa entender conceitos de APIs, requisições HTTP, e como conectar sistemas diferentes @fielding2000architectural.
#linebreak()
*Coordenação Entre Equipes*: Se você tem uma equipe cuidando do backend e outra do frontend, elas precisam se comunicar constantemente para garantir que tudo funcione bem junto @kleppmann2017designing.

== GraphQL: Uma Forma Mais Inteligente de Buscar Dados

Imagine que você vai a um restaurante e pede um prato específico. Com APIs REST tradicionais, é como se o garçom trouxesse a refeição completa mesmo que você só quisesse a salada. Ou então você precisasse fazer três pedidos diferentes para conseguir montar sua refeição completa - um pedido para o prato principal, outro para a bebida, outro para a sobremesa.
#linebreak()
Isso causa dois problemas principais @graphqlspec2025:
1. *_Over-fetching_*: Receber mais dados do que você precisa (desperdício de internet e processamento)
2. *_Under-fetching_*: Precisar fazer várias requisições separadas para conseguir todos os dados necessários (lentidão)

=== Como o GraphQL Resolve Isso

O GraphQL, criado pelo Facebook em 2012 e lançado publicamente em 2015 @graphql2015facebook, funciona como um cardápio inteligente. Você diz exatamente o que quer, na quantidade que quer, e recebe apenas isso - tudo de uma vez só.
#linebreak()
Com GraphQL, você faz uma única pergunta detalhada e recebe exatamente o que pediu. É como dizer ao garçom: "Quero o frango grelhado, mas só a carne e o molho, sem os legumes. E também quero suco de laranja sem gelo." E receber exatamente isso.

=== Características Principais do GraphQL

*Sistema de Tipos*: O GraphQL funciona como um contrato bem definido. Ele especifica exatamente que tipos de dados existem e o que você pode pedir. É como ter um cardápio detalhado que mostra todos os ingredientes disponíveis e como eles podem ser combinados.
#linebreak()
*Ponto Único de Entrada*: Em vez de ter múltiplos endereços (URLs) diferentes para buscar dados, o GraphQL usa um único ponto de entrada. É como ter um balconista único que te ajuda com qualquer pedido, em vez de precisar ir a vários guichês diferentes.
#linebreak()
*Consultas Flexíveis*: Você monta sua consulta pedindo exatamente os campos que precisa. Quer apenas o título e a data de um artigo? Peça só isso. Quer o artigo completo com autor e comentários? Também pode pedir tudo de uma vez.

=== Operações do GraphQL

O GraphQL trabalha com três tipos de operações principais @banks2018learning:
#linebreak()
*_Queries_ (Consultas)*: São operações de leitura de dados. Quando você quer buscar informações do sistema sem modificar nada, usa uma query. É como fazer uma pergunta ao banco de dados: "Me mostre todos os artigos publicados hoje" ou "Qual o nome do autor deste post?". As queries são somente leitura e nunca alteram dados.
#linebreak()
*_Mutations_ (Mutações)*: São operações que modificam dados. Quando você precisa criar, atualizar ou deletar informações, usa uma mutation. É como dar um comando de ação: "Crie um novo artigo", "Atualize o título deste post" ou "Delete este comentário". As mutations sempre retornam os dados modificados para você confirmar a mudança.
#linebreak()
*_Resolvers_ (Resolutores)*: São as funções que realmente executam o trabalho de buscar ou modificar os dados. Quando você faz uma query ou mutation, o resolver é quem vai no banco de dados, pega as informações necessárias e retorna o resultado. É como o cozinheiro que prepara seu pedido na cozinha - você não o vê trabalhando, mas ele é essencial para atender sua requisição.

=== GraphQL em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo, o GraphQL é especialmente útil porque:
#linebreak()
*Adaptação a Diferentes Tipos*: O projeto usa "_Union Types_" (tipos unidos) que permitem que um campo possa conter diferentes tipos de dados - texto, número, data, imagem - e o GraphQL sabe lidar com cada um adequadamente.
#linebreak()
*Filtros Inteligentes*: Você pode fazer buscas específicas:
- Em campos de texto: buscar coisas que "contêm" uma palavra, que "começam com" ou "terminam com" algo
- Em campos numéricos: buscar valores maiores que, menores que, iguais a um número
- Em campos de data: buscar conteúdos antes ou depois de uma data específica
#linebreak()
*Performance Otimizada*: O sistema é inteligente o suficiente para transformar sua consulta GraphQL em comandos otimizados para o banco de dados, buscando apenas o necessário e filtrando direto na fonte.

== Conceitos Técnicos Fundamentais

Antes de prosseguir com conceitos mais avançados, é importante definir alguns termos técnicos que serão utilizados ao longo deste trabalho:
#linebreak()
*_Schema_ (Esquema)*: É como um "projeto" ou "planta" que define a estrutura dos dados. Assim como uma planta arquitetônica mostra onde ficam os quartos e banheiros de uma casa, um schema define quais campos existem em um tipo de conteúdo, que tipo de informação cada campo aceita (texto, número, data), e quais campos são obrigatórios. Em sistemas de banco de dados, o _schema_ garante que os dados sejam armazenados de forma organizada e consistente @silberschatz2018database.
#linebreak()
*_Cache_ (Memória Temporária)*: É um sistema de armazenamento temporário de alta velocidade. Funciona como ter os itens mais usados sempre à mão, em vez de buscar no armário toda vez. Quando uma informação é solicitada frequentemente, o sistema a guarda no _cache_ para acessá-la muito mais rapidamente nas próximas vezes. Isso melhora drasticamente a velocidade do sistema, pois evita consultas repetidas ao banco de dados principal @kleppmann2017designing.
#linebreak()
*JWT (JSON Web Token)*: É um padrão aberto para criar fichas de autenticação compactas e seguras que podem ser transmitidas entre sistemas. Um JWT é como um crachá digital assinado que contém informações sobre o usuário (como seu ID e permissões) codificadas em formato JSON. Quando você faz login em um sistema, ele gera um JWT que você apresenta nas próximas requisições para provar sua identidade, sem precisar enviar usuário e senha novamente. O JWT é assinado digitalmente, o que garante que não pode ser falsificado ou alterado @jones2015jwt.

== Modelagem de Dados Dinâmica e Flexível

A modelagem de dados para CMS que permitem definição dinâmica de tipos de conteúdo apresenta desafios únicos na engenharia de software. Segundo @kleppmann2017designing, sistemas que necessitam de flexibilidade de schema devem balancear cuidadosamente entre performance de consultas e adaptabilidade estrutural.

=== O Padrão _Entity-Attribute-Value_ (EAV)

O padrão _Entity-Attribute-Value_ (EAV), também conhecido como _object-attribute-value_ ou _open schema_, é uma abordagem tradicional para modelagem de dados com _schemas_ dinâmicos @nadkarni2007eav. No modelo EAV, os dados são armazenados em três colunas principais:

- *_Entity_*: Identifica a entidade sendo descrita (ex: ID do produto)
- *_Attribute_*: Nome do atributo (ex: "cor", "tamanho", "peso")
- *_Value_*: Valor do atributo (geralmente armazenado como texto)

Esta abordagem oferece flexibilidade máxima, pois novos atributos podem ser adicionados sem alterações na estrutura da tabela @batra2016eav. No entanto, o padrão EAV apresenta limitações significativas @nadkarni2007eav:
#linebreak()
*_Performance_ de Consultas*: Cada atributo requer uma linha separada na tabela, resultando em operações de JOIN complexas para reconstruir entidades completas. Consultas que em modelos tradicionais seriam simples tornam-se substancialmente mais lentas.
#linebreak()
*Perda de Tipagem*: Armazenar todos os valores como texto elimina as vantagens de tipos de dados nativos do banco, incluindo validação automática, otimizações de armazenamento e operações específicas por tipo.
#linebreak()
*Dificuldade de Indexação*: Índices tradicionais tornam-se menos efetivos quando todos os valores estão na mesma coluna, independentemente do tipo de dado ou semântica.
#linebreak()
*Complexidade de Consultas*: Queries SQL para filtrar ou ordenar por múltiplos atributos tornam-se extremamente verbosas e difíceis de manter.

=== Abordagens Híbridas Modernas

Para endereçar as limitações do EAV, arquiteturas modernas de CMS adotam estratégias híbridas que balanceiam flexibilidade com performance @kleppmann2017designing:
#linebreak()
*Tabelas Tipadas para Primitivos*: Tipos de dados simples e frequentemente consultados (texto, números, datas, booleanos) são armazenados em tabelas dedicadas com tipos nativos do banco de dados. Esta abordagem permite indexação eficiente e otimizações específicas por tipo @silberschatz2018database.
#linebreak()
*Armazenamento JSON para Complexidade*: Estruturas complexas como listas, objetos aninhados e dados semi-estruturados aproveitam suporte nativo de bancos relacionais modernos (PostgreSQL, MySQL 8+) para tipos JSON @postgresql2024json. Isso mantém flexibilidade estrutural enquanto oferece operadores de consulta especializados.
#linebreak()
*Metadados de Schema*: Informações sobre a estrutura dos dados (definição de campos, tipos, validações) são mantidas em tabelas de metadados, permitindo validação em nível de aplicação e geração dinâmica de interfaces @fowler2002patterns.
#linebreak()
*Estratégias de Relacionamento*: Referências entre entidades são gerenciadas através de tabelas de junção dedicadas, preservando integridade referencial enquanto suportam cardinalidades variadas (um-para-um, um-para-muitos, muitos-para-muitos) @silberschatz2018database.
#linebreak()
Estas abordagens híbridas permitem que sistemas modernos de gerenciamento de conteúdo ofereçam a flexibilidade de schemas dinâmicos sem comprometer significativamente a performance das operações mais comuns.

== Controle de Acesso: Do Sistema de Papéis ao Sistema de Atributos

Imagine uma empresa onde existem diferentes cargos: gerente, editor e visitante. O sistema RBAC (sigla em inglês para _Role-Based Access Control_, ou "Controle de Acesso Baseado em Papéis") funciona exatamente assim - você atribui um "papel" ou "cargo" para cada usuário, e esse papel define o que a pessoa pode ou não fazer @sandhu1996role.

Por exemplo:
- Um *Gerente* pode criar, editar e excluir qualquer conteúdo
- Um *Editor* pode criar e editar, mas não excluir
- Um *Visitante* pode apenas visualizar

Esse sistema funcionou bem por muitos anos e ainda é amplamente usado @ferraiolo2003role. No entanto, ele tem três problemas principais que limitam sua aplicabilidade em sistemas modernos @oh2007administration:
#linebreak()
*Explosão de Papéis*: Em empresas grandes, você acaba precisando criar muitos papéis diferentes. Por exemplo: "Editor de Notícias", "Editor de Esportes", "Editor de Tecnologia", "Editor Sênior de Notícias"... A lista cresce rapidamente e fica difícil de gerenciar @researchgate2013abac.
#linebreak()
*Falta de Flexibilidade com Contexto*: O RBAC não consegue criar regras como "Editores só podem publicar durante horário comercial" ou "Este conteúdo só pode ser acessado de dentro da empresa". Ele não considera a situação em que a pessoa está @nist2014abac.
#linebreak()
*Controle Limitado*: É difícil criar regras muito específicas, como "este usuário pode editar o título mas não o corpo do texto" ou "pode ver alguns campos mas não outros" @servos2017abac.

=== O Sistema Moderno: ABAC (Controle Baseado em Atributos)

O ABAC (_Attribute-Based Access Control_, ou "Controle de Acesso Baseado em Atributos") é uma evolução que resolve esses problemas @nist2014abac. Em vez de simplesmente olhar o "cargo" da pessoa, o sistema analisa várias características ou "atributos" antes de decidir se permite ou não uma ação.

O ABAC considera quatro tipos de informação @servos2017abac:

1. *Atributos da Pessoa*: Quem é o usuário (seu ID, cargo, departamento, há quanto tempo trabalha na empresa)
2. *Atributos do Conteúdo*: O que está sendo acessado (tipo de documento, quem criou, nível de confidencialidade, data de criação)
3. *Atributos da Ação*: O que a pessoa quer fazer (ler, editar, excluir, publicar)
4. *Atributos do Ambiente*: Em que situação (horário do dia, localização, tipo de dispositivo usado)

Com ABAC, você pode criar regras mais inteligentes como:
#linebreak()
"Médicos podem acessar prontuários de pacientes do seu departamento, mas apenas durante o horário de trabalho e usando um dispositivo aprovado pelo hospital"
#linebreak()
Essa regra seria extremamente difícil (ou impossível) de implementar com o sistema tradicional de papéis.

=== Como o ABAC Funciona

O sistema ABAC possui quatro componentes principais que trabalham juntos @nist2014abac:
#linebreak()
*Ponto de Decisão (PDP - _Policy Decision Point_)*: É como um juiz que analisa as regras e decide se permite ou nega o acesso. Ele recebe informações sobre quem está tentando fazer o quê, consulta as políticas definidas e dá um veredicto: "permitido" ou "negado".
#linebreak()
*Ponto de Aplicação (PEP - _Policy Enforcement Point_)*: É como um guarda de segurança que intercepta toda tentativa de acesso. Quando alguém tenta fazer algo, o PEP para a requisição e pergunta ao PDP se pode permitir. Só depois da aprovação é que a ação acontece.
#linebreak()
*Ponto de Informação (PIP - _Policy Information Point_)*: É como um banco de dados de informações. Quando o PDP precisa saber se o usuário pertence a determinado departamento ou se hoje é dia útil, ele busca essas informações no PIP.
#linebreak()
*Ponto de Administração (PAP - _Policy Administration Point_)*: É a interface onde os administradores criam e gerenciam as regras de acesso. Funciona como um painel de controle para definir quem pode fazer o quê e em que situação.

=== Por Que o ABAC é Melhor para Sistemas Modernos

O ABAC oferece quatro vantagens principais sobre modelos tradicionais @researchgate2013abac:
#linebreak()
*Mais Expressivo*: Permite criar regras complexas e inteligentes em linguagem quase natural, considerando múltiplos fatores ao mesmo tempo.
#linebreak()
*Mais Flexível*: As regras se adaptam automaticamente às mudanças. Se um funcionário muda de departamento, suas permissões mudam automaticamente sem precisar alterar configurações manualmente.
#linebreak()
*Mais Granular*: Permite controlar o acesso em nível muito detalhado, até mesmo campo por campo em um formulário. Essencial para sistemas de gerenciamento de conteúdo onde diferentes informações têm diferentes níveis de sensibilidade.
#linebreak()
*Mais Contextual*: Leva em conta a situação em que o acesso está acontecendo - horário, local, dispositivo - criando um sistema de segurança mais inteligente e adaptável.

== Frameworks e Padrões para Implementação de ABAC

_Open Policy Agent_ emergiu como padrão de facto para implementação de ABAC em sistemas modernos. Conforme documentado por @openpolicyagentcontributors2024opa, OPA oferece _policy engine_ de propósito geral com linguagem declarativa Rego, arquitetura desacoplada _Policy-as-Code_ e _performance_ otimizada para milhares de autorizações por segundo.
#linebreak()
A linguagem Rego permite expressão de políticas complexas de forma declarativa:

```rego
allow {
  is_editor
  has_department_access
  within_business_hours
}

is_editor {
  input.user.role == "editor"
}

has_department_access {
  input.user.department == input.resource.department
}

within_business_hours {
  9 <= time.clock(time.now_ns())[0] < 17
}
```

XACML permanece como padrão OASIS principal para linguagem de políticas ABAC. Conforme especificado por @oasis2013xacml, XACML define arquitetura, protocolo request/response e 13 algoritmos de combinação para resolução de conflitos entre políticas.
#linebreak()
A estrutura hierárquica do XACML inclui:
- *_Rules_*: Unidade básica de política com condição e efeito
- *_Policies_*: Conjunto de _rules_ com algoritmo de combinação
- *_PolicySets_*: _Container_ para _policies_ com meta-políticas

Algoritmos de combinação como `deny-overrides` e `permit-overrides` resolvem conflitos sistematicamente, essencial para implementações robustas em sistemas enterprise.
#linebreak()
*Casbin*: Biblioteca multi-linguagem que oferece ABAC simplificado usando structs/objetos, popular para implementações em Node.js e Python @casbin2024docs.
#linebreak()
*AWS IAM com Tags*: Implementa ABAC nativamente usando tags como atributos, demonstrando escalabilidade enterprise em ambientes cloud @aws2024abac.
#linebreak()
*Apache Ranger*: Framework abrangente para segurança de dados com suporte nativo para tag-based ABAC policies e integração com Apache Atlas @ranger2024docs.

== Segurança e Performance em Sistemas ABAC

A literatura identifica vulnerabilidades específicas do ABAC que exigem mitigação cuidadosa:
#linebreak()
*_Attribute Poisoning_*: Atacantes manipulam atributos de entrada para obter acesso não autorizado.
#linebreak()
*_Inference Attacks_*: Exploração de padrões comportamentais para inferir regras de políticas. Defendido por limitação da visibilidade de regras aplicáveis e obfuscação de decisões.
#linebreak()
*_Policy Conflicts_*: Múltiplas políticas podem produzir decisões conflitantes. @oasis2013xacml especifica algoritmos formais para resolução, enquanto @combiningpolicies2009 analisa teoria e prática de combinação de políticas.
#linebreak()
*_Smart Mask Ordering_*: Reordenação de avaliação de atributos por probabilidade de decisão, resultando em 89% de melhoria de _performance_.
#linebreak()
*_Attribute Caching_*: _Cache_ distribuído de atributos frequentemente acessados, reduzindo latência de PIPs externos.
#linebreak()
*_Policy Indexing_*: Estruturas de dados otimizadas para busca rápida de políticas aplicáveis baseada em atributos de contexto.

== Tecnologias de Interface Moderna

As tecnologias de interface modernas representam uma evolução significativa no desenvolvimento de aplicações web, oferecendo diferentes abordagens para gerenciamento de estado e atualização de interfaces de usuário. _Frameworks_ modernos como React @react2024docs, Vue @vue2024docs, Svelte @svelte2024docs e SolidJS @solidjs2024docs utilizam programação reativa e _virtual DOM_ (ou compilação direta) para otimizar atualizações de interface.
#linebreak()
Para aplicações de gerenciamento de conteúdo, as características das tecnologias de interface modernas oferecem vantagens específicas:
#linebreak()
*Tamanho Otimizado*: Tecnologias modernas oferecem pacotes menores e tempo de carregamento reduzido, beneficiando _dashboards_ administrativos que frequentemente incluem múltiplas bibliotecas especializadas. Svelte, por exemplo, compila componentes em código JavaScript otimizado, resultando em _bundles_ menores @svelte2024docs.
#linebreak()
*_Performance_ Consistente*: Técnicas modernas de atualização de interface, como o _Virtual DOM_ do React @react2024docs e a reatividade granular do SolidJS @solidjs2024docs, oferecem renderização mais eficiente para aplicações que manipulam grandes volumes de dados, como listas de entradas de conteúdo ou árvores de categorias.

== Trabalhos Correlatos

Para entender melhor o que este projeto oferece, é importante comparar com outros sistemas de gerenciamento de conteúdo existentes no mercado, identificando suas características, limitações e como este trabalho se diferencia.

=== WordPress: O Gigante Tradicional

O WordPress é o sistema de gerenciamento de conteúdo mais popular do mundo, usado por mais de 40% de todos os sites @w3techs2024usage. Ele representa o modelo tradicional onde tudo vem em um pacote único @wordpress2024docs.
#linebreak()
*Pontos Fortes*: Fácil de usar, tem milhares de temas e plugins prontos, grande comunidade de suporte.
#linebreak()
*Limitações*: Quando o site cresce muito ou precisa se integrar com aplicativos de celular, o WordPress mostra suas limitações. Ele não foi feito pensando em arquitetura headless, então usá-lo apenas como backend não é muito eficiente.

=== Joomla: O Meio-Termo

O Joomla é uma alternativa ao WordPress que oferece controle de usuários e permissões um pouco mais robusto, mas ainda mantém a estrutura tradicional onde tudo está acoplado.

=== Strapi: O Principal Concorrente _Headless_

O Strapi é o CMS _headless open-source_ (código aberto) mais conhecido atualmente @strapi2024docs. Ele compartilha várias ideias com este projeto:
#linebreak()
*Semelhanças*:
- Permite criar coleções de conteúdo personalizadas
- Oferece APIs GraphQL e REST
- Tem sistema de permissões baseado em papéis (roles)
- Suporta vários tipos de dados diferentes
#linebreak()
*Diferenças Importantes*:
#linebreak()
*Controle de Permissões*: O Strapi usa apenas o sistema tradicional RBAC (controle por papéis) @strapi2024docs, que só permite definir permissões por tipo de conteúdo inteiro. Este projeto usa ABAC, permitindo controle muito mais fino - até mesmo por campo individual e considerando o contexto (horário, localização, etc.).
#linebreak()
*Organização dos Dados*: Este projeto usa uma estratégia híbrida que organiza os dados de forma mais otimizada dependendo do tipo de informação, resultando em consultas mais rápidas.
#linebreak()
*Regras Contextuais*: O Strapi não consegue criar regras como "só pode publicar durante horário comercial" ou "só pode acessar deste local". Este projeto implementa essas capacidades através do ABAC.

// ================================
// CAPÍTULO 3 - CONCEITO E DESIGN DO SISTEMA
// ================================

= Conceito e Design do Sistema

Este capítulo explica como o sistema foi pensado e construído, quais tecnologias foram escolhidas e por que, e como todas as partes trabalham juntas para criar uma solução completa de gerenciamento de conteúdo.

== Arquitetura do Sistema

O sistema adota arquitetura em três camadas com separação clara de responsabilidades e comunicação via interfaces bem definidas.

#figure(
  image("diagramas/Diagrama do sistema.png", width: 100%),
  caption: [Estrutura do sistema mostrando como as três camadas principais se conectam]
) <fig-system-diagram>

=== Camadas Arquiteturais

*Camada de Persistência*:
- Banco de dados relacional para dados estruturados e relacionais
- Sistema de cache em memória para sessões e resultados de avaliações ABAC

*Camada de Aplicação*:
- API GraphQL como interface principal de consulta
- Endpoints REST para autenticação e gerenciamento de assets
- Motor ABAC integrado para controle de acesso

*Camada de Apresentação*:
- Painel administrativo implementado com tecnologia de interface moderna
- Frontend consumidor pode ser implementado em qualquer tecnologia

=== Decisões Arquiteturais

A arquitetura foi projetada priorizando:
#linebreak()
*Separação de Responsabilidades*: Cada camada possui escopo bem definido, facilitando manutenção e evolução independente dos componentes.
#linebreak()
*Desacoplamento via APIs*: A comunicação entre camadas ocorre exclusivamente através de interfaces contratuais, permitindo substituição de implementações sem impacto em outras camadas.
#linebreak()
*Escalabilidade Horizontal*: As camadas podem escalar independentemente baseado na demanda específica de cada componente.
#linebreak()
*Flexibilidade Tecnológica*: A camada de apresentação não está acoplada a nenhuma tecnologia específica, permitindo múltiplas implementações consumindo as mesmas APIs.

== Modelagem do Banco de Dados

A modelagem de dados implementa estratégia híbrida combinando tabelas tipadas para primitivos com armazenamento JSON para estruturas complexas, conforme discutido no referencial teórico.

=== Entidades Principais

O sistema organiza dados em três níveis hierárquicos:
#linebreak()
*_Collections_ (Coleções)*: Define os tipos de conteúdo (ex: "Artigos", "Produtos"). Cada coleção especifica seus campos, suporte à internacionalização e configurações visuais.
#linebreak()
*_Fields_ (Campos)*: Especifica os atributos de cada coleção com tipo de dado, validações e classificação de segurança (público, interno, confidencial, restrito).
#linebreak()
*_Entries_ (Entradas)*: Representa as instâncias de conteúdo com _status_ de publicação (rascunho, publicado, arquivado), controle de versão e suporte multilíngue.
#linebreak()
A Figura 3.2 apresenta em detalhe como essas três entidades principais se relacionam com as tabelas de valores tipados:

#figure(
  image("diagramas/collections_and_entries.png", width: 100%),
  caption: [Estrutura detalhada das tabelas Collections, Fields e Entries com suas tabelas de valores associadas (texto, número, booleano, data, rich text, JSON, assets e relacionamentos)]
) <fig-collections-entries>

=== Estratégia de Armazenamento por Tipo

O sistema utiliza abordagem híbrida otimizada conforme a natureza dos dados:
#linebreak()
*Tipos Primitivos*: Campos simples (texto, número, booleano, data) são armazenados em tabelas dedicadas com índices otimizados para consultas rápidas.
#linebreak()
*Tipos Complexos*: Estruturas como listas e objetos JSON aproveitam o suporte nativo do PostgreSQL para dados semi-estruturados.
#linebreak()
*Tipos Especiais*: _Rich text_ mantém versões _raw_ e renderizada. _Assets_ incluem metadados de acessibilidade. Relacionamentos permitem conexões entre entradas.
#linebreak()
Esta estratégia balanceia performance (primitivos indexados) com flexibilidade (estruturas complexas em JSON).

=== Tabelas de Segurança e Controle de Acesso

O banco de dados inclui um conjunto completo de tabelas para implementar o sistema ABAC, conforme ilustrado na Figura 3.3:

#figure(
  image("diagramas/simplified_security_related_to_content.png", width: 100%),
  caption: [Tabelas de segurança (users, roles, policies) e sua relação com as entidades de conteúdo (collections, entries, fields, assets)]
) <fig-security-content>

As tabelas principais de segurança incluem:
#linebreak()
*_users_*: Armazena credenciais e _status_ dos usuários
#linebreak()
*_roles_ e _user_policies_*: Gerencia papéis e atribuição de políticas a usuários
#linebreak()
*_abac_policies_ e _abac_policy_rules_*: Define políticas ABAC com suas regras de avaliação
#linebreak()
*_resource_ownerships_*: Rastreia propriedade de recursos (criador, atribuído, herdado)
#linebreak()
*_abac_evaluation_cache_*: _Cache_ de decisões para otimização de _performance_
#linebreak()
*_abac_audit_*: Auditoria completa de todas as decisões de autorização
#linebreak()
A Figura 3.4 apresenta o diagrama completo com todas as tabelas do sistema ABAC e seus relacionamentos detalhados:

#figure(
  image("diagramas/security.png", width: 100%),
  caption: [Diagrama completo do sistema ABAC mostrando todas as tabelas de segurança (policies, rules, cache, audit) e suas relações com usuários e recursos]
) <fig-security-complete>

== Sistema de Controle de Acesso

Implementação do modelo ABAC discutido no referencial teórico, com políticas declarativas armazenadas no banco de dados e motor de avaliação integrado.

=== Arquitetura do ABAC

O sistema utiliza quatro componentes principais:
#linebreak()
*Políticas e Regras*: Políticas declarativas com efeito (permitir/negar), prioridade e conectores lógicos. Cada política contém regras que avaliam atributos do sujeito (usuário), recurso, ação e ambiente (horário, IP).
#linebreak()
*_Cache_ de Avaliação*: Sistema de _cache_ de alta _performance_ que armazena decisões recentes, reduzindo drasticamente o tempo de autorização em operações frequentes.
#linebreak()
*Sistema de Auditoria*: _Log_ completo de todas as decisões incluindo contexto, políticas avaliadas e justificativa, essencial para _compliance_ e _debugging_.
#linebreak()
*Classificação de Dados*: Campos podem ser marcados com níveis de sensibilidade (público, interno, confidencial, restrito) e identificados como dados pessoais (PII), permitindo políticas automáticas baseadas na classificação.

=== Tipos de Atributos

O sistema avalia decisões baseado em quatro categorias de atributos:
#linebreak()
*Atributos do Usuário*: Papel, status, departamento e histórico de criação
#linebreak()
*Atributos do Recurso*: Tipo, proprietário, status de publicação e sensibilidade
#linebreak()
*Atributos da Ação*: Operação sendo realizada (criar, ler, editar, publicar, etc.)
#linebreak()
*Atributos Ambientais*: Horário da requisição, localização e dispositivo usado
#linebreak()
Esta combinação permite criar regras contextuais como "editores podem publicar artigos do seu departamento durante horário comercial".

=== Resolução de Conflitos

O sistema implementa resolução determinística de conflitos através de:
- Prioridade numérica para ordenar políticas conflitantes
- Conectores lógicos (AND/OR) para combinar múltiplas condições
- Arquitetura "negar por padrão" seguindo o princípio de menor privilégio

Exemplo de política implementável:

```
ALLOW READ ON fields WHERE
  sensitivityLevel = 'PUBLIC' OR
  (sensitivityLevel = 'INTERNAL' AND
   subject.role IN ['editor', 'admin'] AND
   environment.currentTime BETWEEN 09:00-17:00)
```

== APIs e Protocolos de Comunicação

O sistema oferece duas interfaces de comunicação complementares, cada uma otimizada para casos de uso específicos.

=== API REST

Implementada para operações onde simplicidade e compatibilidade são prioritárias:
#linebreak()
*Autenticação* (`/auth`): _Login_, _logout_, _refresh_ de _tokens_ e recuperação de senha.
#linebreak()
*_Assets_* (`/assets`): Envio, _download_ e transmissão de arquivos multimídia. A natureza binária e necessidades de transmissão em tempo real justificam REST sobre GraphQL.
#linebreak()
*Convenções*:
- Métodos HTTP semânticos (GET, POST, PUT/PATCH, DELETE)
- Status codes consistentes (2xx sucesso, 4xx erro cliente, 5xx erro servidor)
- Content-Type apropriado (multipart/form-data para uploads, application/json para metadados)

=== API GraphQL

Interface principal do sistema, oferecendo flexibilidade superior conforme discutido no referencial teórico.
#linebreak()
*_Design_ do Esquema*: _Queries_ e _mutations_ estruturadas para eliminar necessidade de _joins_ manuais pelo cliente.
#linebreak()
*_Union Types_ para Flexibilidade*: Utilização de _Union Types_ para representar diferentes tipos de campos (`FieldValue`), mantendo _type safety_ para diferentes estruturas de dados:
#linebreak()
```graphql
union FieldValue = Text | TypstText | Asset | BooleanValue | 
                   NumberValue | DateTime | RichText | Json | Relation
```
#linebreak()
*Sistema de filtragem*: Filtros específicos por tipo implementando os operadores discutidos no referencial teórico:
- Texto: `contains`, `startsWith`, `endsWith`, `equals`
- Numérico: `gt`, `gte`, `lt`, `lte`, `equals`
- Data: `before`, `after`, `equals`
- Booleano: `equals`
- Relacionamentos: `exists`, `in`, `notIn`
#linebreak()
*Otimizações*:
- _Resolvers_ aplicam filtros diretamente no banco via SQL otimizado
- _Cursor-based pagination_ para conjuntos de dados grandes
- Ordenação multi-campo

Exemplo de query combinando metadados de coleção com filtragem de conteúdo:

```graphql
query ($name: String!, $fieldName: String!) {
  collection(name: $name) {
    name
    fields { name dataType }
    entries {
      name
      field(name: $fieldName, filter: { text: { eq: "value" } }) {
        ... on Text { text }
      }
    }
  }
}
```

*Integração com ABAC*:
- _Higher-order functions_ protegendo _resolvers_ automaticamente
- Filtragem de resultados baseada em permissões do usuário
- Controle _field-level_ impedindo acesso a campos restritos
- _Error handling_ padronizado para autenticação e autorização

== Interface Administrativa

Implementação utilizando tecnologia de interface moderna aproveitando as características discutidas no referencial teórico.

=== Características Técnicas

*Arquitetura Reativa*: Atualizações eficientes de interface baseadas em mudanças de estado.
#linebreak()
*Segurança de Tipos*: Integração com tipagem estática end-to-end entre frontend e backend.
#linebreak()
*Interface Adaptativa*: UI se adapta automaticamente aos schemas definidos, gerando formulários e componentes específicos por tipo de campo.

=== Módulos Principais

*Painel de Controle*: Visão geral de coleções, estatísticas e navegação filtrada por permissões ABAC.
#linebreak()
*Editor de Coleções*: Definição de tipos de conteúdo com validação em tempo real.
#linebreak()
*Editor de Entradas*: Formulários gerados dinamicamente baseados no _schema_ da coleção.
#linebreak()
*Gerenciador de _Assets_*: Envio e organização de mídias com metadados de acessibilidade.
#linebreak()
*Configuração de Permissões*: _Interface_ para criação e gerenciamento de políticas ABAC.


== Tecnologias, Segurança e Performance

Esta seção apresenta as tecnologias selecionadas e as estratégias implementadas para garantir segurança e performance do sistema.

=== Tecnologias Utilizadas

*_Backend_*: Linguagem com tipagem estática para APIs, adequada para operações I/O intensivas. Banco de dados PostgreSQL oferecendo conformidade ACID e suporte nativo a JSON. Redis como _cache_ de alta _performance_ para sessões e avaliações ABAC.
#linebreak()
*_Frontend_*: _Framework_ de interface moderna com atualizações eficientes, sintaxe declarativa e integração de tipos _end-to-end_ com o _backend_.
#linebreak()
*APIs*: GraphQL como interface principal para consultas flexíveis. REST para operações específicas (autenticação e envio de arquivos) onde simplicidade é prioritária.

=== Segurança

*Autenticação e Sessões*: Sistema baseado em JWT com criptografia assimétrica, permitindo validação distribuída. Sessões gerenciadas com TTL automático e renovação baseada em atividade.
#linebreak()
*Controle de Acesso*: Sistema ABAC integrado em todos os _resolvers_ GraphQL e _endpoints_ REST, com auditoria completa de decisões.
#linebreak()
*Proteção de Dados*: Validação de _inputs_ via _schemas_ tipados. _Queries_ parametrizadas prevenindo _SQL injection_. Suporte a criptografia em repouso para campos sensíveis.
#linebreak()
*Transporte*: TLS/HTTPS garantindo confidencialidade e integridade de todas as comunicações.

=== Otimizações de Performance

*Banco de Dados*: Índices estratégicos para consultas e filtragem de conteúdo. _Connection pooling_ otimizado. _Prepared statements_ para _queries_ frequentes.
#linebreak()
*GraphQL*: _DataLoader_ eliminando problema N+1 em consultas relacionadas. _Query complexity analysis_ prevenindo _queries_ abusivas. _Cache_ de _schemas_.

