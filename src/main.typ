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

Um Sistema de Gerenciamento de Conteúdo (ou CMS, da sigla em inglês _Content Management System_) é como um painel de controle para gerenciar o conteúdo de um site @nath2010content. Ele permite que pessoas sem conhecimento técnico possam criar, editar e publicar textos, imagens e vídeos em um site, sem precisar saber programação.

Pense no CMS como um editor de documentos, similar ao Microsoft Word, mas para sites. Em vez de precisar escrever código para adicionar uma nova notícia ou atualizar uma foto, você simplesmente usa uma interface visual, clica em botões e preenche formulários @boiko2005.

=== A Evolução dos CMS

Os sistemas de gerenciamento de conteúdo evoluíram significativamente desde o surgimento da web. Inicialmente, a publicação de conteúdo na internet exigia conhecimento técnico: desenvolvedores precisavam editar manualmente arquivos HTML e fazer upload via FTP para cada atualização no site @boiko2005.

Com o amadurecimento da web nos anos 2000, surgiram plataformas que simplificaram radicalmente este processo. Sistemas como WordPress (lançado em 2003) e Joomla (2005) democratizaram a criação de sites ao oferecer interfaces visuais intuitivas, permitindo que usuários sem conhecimento de programação pudessem gerenciar conteúdo @headless2021decoupled; @boiko2005; @wordpress2024docs; @joomla2024docs. Esta abordagem foi tão bem-sucedida que, atualmente, o WordPress sozinho é utilizado por mais de 40% de todos os sites da internet @w3techs2024usage.

Mais recentemente, observa-se o crescimento de uma arquitetura conhecida como CMS headless, onde o backend de gerenciamento de conteúdo é completamente separado do frontend de apresentação através de APIs @headless2021decoupled; @boiko2005. Esta separação oferece maior flexibilidade para distribuir o mesmo conteúdo através de múltiplos canais (web, aplicativos móveis, dispositivos IoT, etc.), respondendo às demandas de uma experiência digital cada vez mais diversificada.

=== Funções Fundamentais de um CMS

Um sistema de gerenciamento de conteúdo, independentemente de sua complexidade, realiza três funções fundamentais @boiko2005:

1. *Coleta (Collection)*: Criação ou aquisição de conteúdo de fontes existentes. Dependendo da origem, pode ser necessário converter o conteúdo para um formato padrão. Esta etapa inclui edição, segmentação em componentes menores e adição de metadados apropriados.

2. *Gerenciamento (Management)*: Armazenamento estruturado do conteúdo em um repositório, que consiste em registros de banco de dados e/ou arquivos contendo componentes de conteúdo e dados administrativos. Inclui controle de versões, workflow e administração de usuários.

3. *Publicação (Publishing)*: Disponibilização do conteúdo através da extração de componentes do repositório e construção de publicações direcionadas, como sites, documentos imprimíveis e newsletters. As publicações consistem em componentes organizados adequadamente, funcionalidades, informações padrão e navegação.

=== Três Tipos de CMS

Hoje existem três categorias principais de CMS @headless2021decoupled:
#linebreak()
*CMS Tradicionais*: Sistemas integrados onde backend e frontend formam um pacote único com forte acoplamento entre as camadas @headless2021decoupled; @wordpress2024docs. Exemplos como WordPress e Joomla são fáceis de usar e instalar, mas têm limitações quando se precisa de personalização avançada ou suporte a múltiplos canais de distribuição.
#linebreak()
*CMS _Headless_ (Desacoplados)*: Arquiteturas que separam completamente o gerenciamento de conteúdo da camada de apresentação através de APIs @headless2021decoupled; @boiko2005. Esta abordagem permite distribuir o mesmo conteúdo através de múltiplos canais (web, mobile, IoT) de forma agnóstica à tecnologia de frontend, oferecendo flexibilidade máxima para criar experiências personalizadas.
#linebreak()
*CMS Híbridos*: Combinam características de ambas as abordagens, oferecendo flexibilidade para escolher entre acoplamento tradicional ou arquitetura desacoplada conforme a necessidade específica do projeto @headless2021decoupled; @strapi2024docs.

== Arquitetura _Headless_: Separando a "Cabeça" do "Corpo"

Antes de entender a arquitetura headless, é importante conhecer dois conceitos fundamentais da arquitetura cliente-servidor @sommerville2010. Em sistemas distribuídos que são acessados pela internet, o usuário interage com um programa executando em seu computador local (como um navegador web ou aplicativo móvel), que se comunica com outro programa executando em um computador remoto (como um servidor web). Essa arquitetura cliente-servidor pode ser modelada em camadas lógicas, cada uma com responsabilidades distintas:
#linebreak()
*_Backend_ (Retaguarda)*: Corresponde às camadas de aplicação, manipulação de dados e banco de dados no servidor. Inclui o armazenamento de dados, a lógica de negócios que processa as informações, e o sistema de segurança que controla o acesso. É a parte "invisível" do sistema que executa no servidor, como os bastidores de um teatro onde todo o trabalho acontece.
#linebreak()
*_Frontend_ (Interface)*: Corresponde à camada de apresentação que executa no cliente. É responsável por apresentar informações ao usuário e gerenciar toda a interação - a interface gráfica, botões, formulários e menus. Executa no navegador do usuário (Chrome, Firefox, Safari) ou em aplicativos nativos, comunicando-se com o backend para buscar ou enviar dados. É como o palco do teatro onde a apresentação acontece.

=== O Que É um CMS _Headless_

Em um CMS tradicional, a camada de apresentação (frontend) está fortemente acoplada à camada de gerenciamento de conteúdo (backend), formando uma aplicação monolítica. Isso significa que alterações na interface requerem modificações no sistema como um todo.

Um CMS _Headless_ implementa uma arquitetura desacoplada: a "cabeça" (_frontend_ - a camada de apresentação) está completamente separada do "corpo" (_backend_ - as camadas de dados e lógica de negócios) @headless2021decoupled. A comunicação entre essas camadas acontece exclusivamente através de uma API (_Application Programming Interface_ - Interface de Programação de Aplicações). Essa separação permite que cada camada seja desenvolvida, mantida e escalada de forma independente.

=== _API-First_: Construindo Pela Ponte de Comunicação

O conceito "_API-first_" significa que, ao construir o sistema, a primeira coisa que se define é a interface de comunicação (a API) entre as camadas @headless2021decoupled. Isso garante que o backend possa servir dados de forma consistente para qualquer tipo de cliente (web, móvel, IoT) desde o início do projeto.

Essa abordagem permite o "_Content as a Service_" (CaaS), ou "Conteúdo como Serviço": o conteúdo é disponibilizado através da API como um serviço independente. Múltiplos clientes podem consumir o mesmo conteúdo simultaneamente - sites, aplicativos móveis, dispositivos IoT, assistentes de voz - todos acessando a mesma fonte de dados através de chamadas à API.

=== Vantagens da Arquitetura _Headless_

*Liberdade Tecnológica*: Você pode usar as melhores ferramentas para cada parte @headless2021decoupled. Diferentes tecnologias de interface podem coexistir - site, aplicativo móvel e painel administrativo podem usar tecnologias distintas, mas todos consomem os mesmos dados do backend.
#linebreak()
*Escalabilidade Independente*: A arquitetura desacoplada permite que cada componente escale de forma independente conforme sua demanda específica @headless2021decoupled. Aplicando princípios de arquiteturas _shared-nothing_, onde cada componente utiliza recursos computacionais independentes @kleppmann2017designing, é possível aumentar recursos do frontend quando há picos de tráfego ou expandir o backend quando necessário processar mais conteúdo, sem afetar outros componentes do sistema.
#linebreak()
*Reutilização Máxima de Conteúdo*: O mesmo conteúdo pode ser consumido por múltiplos canais sem necessidade de duplicação @headless2021decoupled. Um artigo criado uma vez pode ser distribuído automaticamente para site, aplicativo móvel, assistentes de voz, smartwatches e outros dispositivos conectados.
#linebreak()
*Estratégia _Omnichannel_*: _Omnichannel_ significa "todos os canais" @headless2021decoupled. Você oferece uma experiência unificada para seus usuários em qualquer plataforma que eles escolham usar.

=== Desafios da Arquitetura _Headless_

A arquitetura _headless_ apresenta complexidades que devem ser consideradas @headless2021decoupled:
#linebreak()
*Maior Complexidade Técnica*: Diferentemente de sistemas monolíticos tradicionais que oferecem interfaces integradas prontas para uso, sistemas headless exigem que desenvolvedores compreendam conceitos de APIs, protocolos de comunicação cliente-servidor, e arquiteturas distribuídas @sommerville2010.
#linebreak()
*Coordenação Entre Equipes*: A separação entre frontend e backend requer coordenação cuidadosa entre equipes que trabalham em cada camada, garantindo que as interfaces de comunicação permaneçam consistentes e que mudanças sejam sincronizadas adequadamente. Em sistemas distribuídos, a coordenação adequada é essencial para manter a integridade e consistência dos dados @kleppmann2017designing.

== GraphQL: Uma Forma Mais Inteligente de Buscar Dados

Imagine que você vai a um restaurante e pede um prato específico. Com APIs REST tradicionais, é como se o garçom trouxesse a refeição completa mesmo que você só quisesse a salada. Ou então você precisasse fazer três pedidos diferentes para conseguir montar sua refeição completa - um pedido para o prato principal, outro para a bebida, outro para a sobremesa.
#linebreak()
Isso causa dois problemas principais @banks2018learning:
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

O GraphQL trabalha com dois tipos principais de operações @banks2018learning:
#linebreak()
*_Queries_ (Consultas)*: São operações de leitura de dados. Quando você quer buscar informações do sistema sem modificar nada, usa uma query. É como fazer uma pergunta ao banco de dados: "Me mostre todos os artigos publicados hoje" ou "Qual o nome do autor deste post?". As queries são somente leitura e nunca alteram dados.
#linebreak()
*_Mutations_ (Mutações)*: São operações que modificam dados. Quando você precisa criar, atualizar ou deletar informações, usa uma mutation. É como dar um comando de ação: "Crie um novo artigo", "Atualize o título deste post" ou "Delete este comentário". As mutations sempre retornam os dados modificados para você confirmar a mudança.

=== Resolvers: Conectando GraphQL aos Dados

Para que as operações do GraphQL funcionem, cada campo na API precisa de um _resolver_ correspondente. Um _resolver_ é uma função que retorna dados para um campo específico @banks2018learning. Quando você faz uma query ou mutation, o resolver é quem vai no banco de dados, busca as informações necessárias e retorna o resultado. É como o cozinheiro que prepara seu pedido na cozinha - você não o vê trabalhando, mas ele é essencial para atender sua requisição. Os resolvers devem seguir as regras definidas no schema, retornando os dados no tipo e formato especificados.

=== GraphQL em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo, o GraphQL é especialmente útil porque:
#linebreak()
*Adaptação a Diferentes Tipos*: O GraphQL suporta "_Union Types_" (tipos unidos) que permitem que um campo possa conter diferentes tipos de dados @banks2018learning. Um mesmo campo pode retornar texto, número, data ou imagem, e o GraphQL sabe lidar com cada tipo adequadamente através de fragmentos específicos para cada variação.
#linebreak()
*Filtros por Argumentos*: GraphQL permite passar argumentos nas consultas para filtrar resultados @banks2018learning. Você pode fazer buscas específicas em campos de texto (contém, começa com, termina com), campos numéricos (maior que, menor que, igual a), e campos de data (antes de, depois de), tornando as consultas mais precisas e eficientes.

== Conceitos Técnicos Fundamentais

Antes de prosseguir com conceitos mais avançados, é importante definir alguns termos técnicos que serão utilizados ao longo deste trabalho:
#linebreak()
*_Schema_ (Esquema)*: É como um "projeto" ou "planta" que define a estrutura dos dados. Assim como uma planta arquitetônica mostra onde ficam os quartos e banheiros de uma casa, um schema define quais campos existem em um tipo de conteúdo, que tipo de informação cada campo aceita (texto, número, data), e quais campos são obrigatórios. Em sistemas de banco de dados, o _schema_ garante que os dados sejam armazenados de forma organizada e consistente @silberschatz2018database.
#linebreak()
*_Cache_ (Memória Temporária)*: É um sistema de armazenamento temporário de alta velocidade. Funciona como ter os itens mais usados sempre à mão, em vez de buscar no armário toda vez. Quando uma informação é solicitada frequentemente, o sistema a guarda no _cache_ para acessá-la muito mais rapidamente nas próximas vezes. Isso melhora drasticicamente a velocidade do sistema, pois evita consultas repetidas ao banco de dados principal @kleppmann2017designing.
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
*Metadados de Schema*: Informações sobre a estrutura dos dados (definição de campos, tipos, validações) são mantidas em tabelas de metadados. Esta abordagem de "Metadata Mapping" permite processar mapeamentos objeto-relacional de forma genérica através de código que interpreta os metadados, facilitando operações de leitura, inserção e atualização sem código repetitivo @fowler2002patterns.
#linebreak()
*Estratégias de Relacionamento*: Referências entre entidades são gerenciadas através de tabelas de junção dedicadas, preservando integridade referencial enquanto suportam cardinalidades variadas (um-para-um, um-para-muitos, muitos-para-muitos) @silberschatz2018database.
#linebreak()
Estas abordagens híbridas permitem que sistemas modernos de gerenciamento de conteúdo ofereçam a flexibilidade de schemas dinâmicos sem comprometer significativamente a performance das operações mais comuns.

== Controle de Acesso Baseado em Atributos (ABAC)

Sistemas de controle de acesso definem quem pode acessar quais recursos em um sistema. O modelo tradicional RBAC (_Role-Based Access Control_) associa permissões a papéis organizacionais: um usuário com papel "Editor" recebe todas as permissões definidas para esse papel @sandhu1996role. Embora amplamente utilizado @ferraiolo2003role, o RBAC apresenta limitações em ambientes complexos: explosão do número de papéis necessários, incapacidade de considerar atributos dinâmicos como horário e localização, e dificuldade em implementar controle granular fino @coyne2013abac.
#linebreak()
O ABAC (_Attribute-Based Access Control_) representa evolução dos modelos de controle de acesso ao basear decisões de autorização em atributos de múltiplas dimensões @nist2014abac. Diferentemente do RBAC, que avalia apenas o papel do usuário, o ABAC considera atributos do sujeito (usuário), do recurso (objeto sendo acessado), da ação (operação requisitada) e do ambiente (contexto situacional como horário e localização) @servos2017abac.

=== Arquitetura e Componentes

A arquitetura ABAC, conforme especificada por @nist2014abac, compreende quatro componentes principais:
#linebreak()
*Policy Decision Point (PDP)*: Motor de decisão que avalia políticas e atributos para produzir veredictos de autorização.
#linebreak()
*Policy Enforcement Point (PEP)*: Ponto de interceptação que requisita decisões ao PDP e aplica os veredictos.
#linebreak()
*Policy Information Point (PIP)*: Repositório de atributos que fornece informações contextuais ao PDP.
#linebreak()
*Policy Administration Point (PAP)*: Interface para criação e gerenciamento de políticas.
#linebreak()
Esta arquitetura permite expressar regras como "usuários do departamento X podem editar recursos confidenciais apenas durante horário comercial", combinando múltiplos atributos em uma única política @nist2014abac.

=== Padrões e Implementações

XACML (_eXtensible Access Control Markup Language_) constitui o padrão OASIS para especificação de políticas ABAC @oasis2013xacml. XACML define estrutura hierárquica de _rules_, _policies_ e _policy sets_, além de algoritmos de combinação (`deny-overrides`, `permit-overrides`) para resolução determinística de conflitos entre políticas @combiningpolicies2009.
#linebreak()
_Open Policy Agent_ (OPA) emergiu como implementação moderna de ABAC, oferecendo linguagem declarativa Rego para especificação de políticas e arquitetura desacoplada _policy-as-code_ @openpolicyagentcontributors2024opa. Outras implementações incluem Casbin (biblioteca multi-linguagem) @casbin2024docs, AWS IAM com atributos baseados em tags @aws2024abac, e Apache Ranger para segurança de dados @ranger2024docs.
#linebreak()
Para sistemas de gerenciamento de conteúdo, o ABAC oferece controle granular essencial: diferentes campos podem ter diferentes níveis de sensibilidade, e o acesso pode variar baseado em propriedade do conteúdo, status de publicação e contexto do usuário. Esta flexibilidade permite implementar requisitos complexos de segurança mantendo políticas centralizadas e auditáveis @nist2014abac.

== Tecnologias de Interface Moderna

As tecnologias de interface modernas representam uma evolução significativa no desenvolvimento de aplicações web, oferecendo diferentes abordagens para gerenciamento de estado e atualização de interfaces de usuário. _Frameworks_ modernos como React @react2024docs, Vue @vue2024docs, Svelte @svelte2024docs e SolidJS @solidjs2024docs utilizam programação reativa e _virtual DOM_ (ou compilação direta) para otimizar atualizações de interface.
#linebreak()
Para aplicações de gerenciamento de conteúdo, as características das tecnologias de interface modernas oferecem vantagens específicas:
#linebreak()
*Tamanho Otimizado*: Tecnologias modernas oferecem pacotes menores e tempo de carregamento reduzido, beneficiando _dashboards_ administrativos que frequentemente incluem múltiplas bibliotecas especializadas. Svelte, por exemplo, compila componentes em código JavaScript otimizado, resultando em _bundles_ menores que frameworks tradicionais @svelte2024docs.
#linebreak()
*_Performance_ Consistente*: Técnicas modernas de atualização de interface, como o _Virtual DOM_ do React @react2024docs e a reatividade granular do SolidJS @solidjs2024docs, oferecem renderização mais eficiente para aplicações que manipulam grandes volumes de dados, como listas de entradas de conteúdo ou árvores de categorias.

== Trabalhos Correlatos

Para entender melhor o que este projeto oferece, é importante comparar com outros sistemas de gerenciamento de conteúdo existentes no mercado, identificando suas características, limitações e como este trabalho se diferencia.

=== WordPress: O Gigante Tradicional

O WordPress é o sistema de gerenciamento de conteúdo mais popular do mundo, usado por mais de 40% de todos os sites @w3techs2024usage. Ele representa o modelo tradicional de CMS monolítico onde todas as camadas estão fortemente acopladas @headless2021decoupled; @wordpress2024docs.
#linebreak()
*Pontos Fortes*: Fácil de usar, ecossistema extenso com milhares de temas e plugins, grande comunidade de suporte @wordpress2024docs.
#linebreak()
*Limitações*: A arquitetura monolítica dificulta escalabilidade em ambientes de alto tráfego e integração com múltiplos canais de distribuição @headless2021decoupled. Embora existam extensões para funcionar como headless CMS, o sistema não foi originalmente projetado para essa arquitetura, resultando em performance subótima quando usado apenas como backend.

=== Joomla: O Meio-Termo

O Joomla é uma alternativa ao WordPress que oferece controle de usuários e sistema de permissões mais robusto, mantendo a estrutura tradicional monolítica característica de CMS acoplados @headless2021decoupled; @joomla2024docs. Assim como outros CMS tradicionais, enfrenta limitações similares ao WordPress quando se trata de arquiteturas multi-canal e escalabilidade distribuída.

=== Strapi: O Principal Concorrente _Headless_

O Strapi é o CMS _headless open-source_ (código aberto) mais conhecido atualmente @strapi2024docs. Ele compartilha várias ideias com este projeto:
#linebreak()
*Semelhanças*:
- Permite criar coleções de conteúdo personalizadas @strapi2024docs
- Oferece APIs GraphQL e REST para acesso ao conteúdo
- Tem sistema de permissões baseado em papéis (roles)
- Suporta vários tipos de dados diferentes
#linebreak()
*Diferenças Importantes*:
#linebreak()
*Controle de Permissões*: O Strapi usa apenas o sistema tradicional RBAC (controle por papéis) @strapi2024docs, que só permite definir permissões por tipo de conteúdo inteiro. Este projeto usa ABAC, permitindo controle muito mais fino - até mesmo por campo individual e considerando o contexto (horário, localização, etc.) conforme especificado por @nist2014abac.
#linebreak()
*Organização dos Dados*: Este projeto usa uma estratégia híbrida que organiza os dados de forma mais otimizada dependendo do tipo de informação, evitando as limitações do padrão EAV @nadkarni2007eav enquanto mantém flexibilidade de schema.
#linebreak()
*Regras Contextuais*: O Strapi não consegue criar regras como "só pode publicar durante horário comercial" ou "só pode acessar deste local". Este projeto implementa essas capacidades através do ABAC @nist2014abac.

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

