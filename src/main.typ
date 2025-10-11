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

Criar um site interativo que funcione com banco de dados é um dos maiores desafios no desenvolvimento de sites modernos. Para fazer isso, o desenvolvedor precisa dominar várias tecnologias diferentes ao mesmo tempo. É como precisar construir uma casa e ao mesmo tempo projetar toda a parte elétrica e hidráulica - tudo precisa funcionar junto de forma harmoniosa.

De um lado, temos a parte visual do site (chamada de frontend), onde o desenvolvedor precisa criar uma experiência agradável para o usuário, fazer o site funcionar bem em celulares e computadores, e garantir que tudo responda rapidamente aos cliques e ações do visitante. Do outro lado, temos a parte invisível (o backend), que cuida de armazenar informações, verificar quem pode acessar o quê, e proteger os dados dos usuários.

Juntar essas duas partes é complicado. Imagine que você precisa garantir que o site seja rápido mesmo com milhares de visitantes ao mesmo tempo, funcione bem em qualquer dispositivo, e ainda seja seguro contra pessoas mal-intencionadas que tentam roubar informações. Tudo isso exige muito conhecimento e experiência, tornando o processo longo e difícil para muitos desenvolvedores.

== Objetivos

=== Objetivo Geral

Desenvolver um sistema de gerenciamento de conteúdo headless (CMS Headless) que permita a criação, edição e distribuição de conteúdo de forma desacoplada, oferecendo flexibilidade para desenvolvedores criarem interfaces personalizadas enquanto mantém a facilidade de uso para editores de conteúdo, demonstrando na prática as vantagens arquiteturais desta abordagem moderna em comparação aos CMS tradicionais.

=== Objetivos Específicos

1. Implementar uma arquitetura de banco de dados PostgreSQL que suporte a natureza dinâmica das coleções de conteúdo
2. Desenvolver um sistema de autenticação utilizando tokens JWT com criptografia RSA
3. Criar uma interface administrativa em SolidJS para gerenciamento de conteúdo
4. Implementar APIs REST e GraphQL para consumo flexível do conteúdo
5. Desenvolver um sistema de gerenciamento de assets para mídias
6. Implementar controle de acesso granular até o nível de campos individuais
7. Demonstrar a flexibilidade da arquitetura headless através de casos de uso práticos

== Metodologia

O CMS Headless será desenvolvido com uma arquitetura centrada na flexibilidade de criação e gerenciamento de conteúdo. O sistema permitirá aos usuários definir suas próprias coleções de dados de forma dinâmica através de um dashboard administrativo, onde cada coleção poderá ter campos e tipos de dados customizados conforme a necessidade específica do projeto, eliminando a rigidez dos CMS tradicionais baseados em templates fixos.

O sistema de autenticação utilizará tokens JWT com criptografia RSA, garantindo segurança na comunicação e controle de acesso granular aos recursos do CMS. Os usuários autenticados poderão criar, editar e gerenciar suas coleções através de uma interface que será construída em SolidJS, oferecendo uma experiência reativa e moderna para administração de conteúdo.

A arquitetura do banco de dados PostgreSQL será projetada para suportar a natureza dinâmica das coleções, permitindo que o sistema armazene diferentes tipos de conteúdo sem necessidade de modificações estruturais no esquema do banco. O sistema também incorporará um serviço dedicado para gerenciamento de assets, facilitando o upload e organização de mídias associadas ao conteúdo.

A camada de consultas oferecerá APIs que permitirão aos desenvolvedores frontend consumir o conteúdo de forma flexível, seja através de consultas REST ou GraphQL, proporcionando total liberdade na apresentação dos dados em qualquer tecnologia ou plataforma. Esta abordagem demonstrará como um CMS Headless pode oferecer máxima flexibilidade tanto para criadores de conteúdo quanto para desenvolvedores.

// ================================
// CAPÍTULO 2 - REFERENCIAL TEÓRICO
// ================================

= Referencial Teórico

Este capítulo apresenta o referencial teórico fundamental para compreensão dos conceitos, tecnologias e metodologias empregadas no desenvolvimento do sistema proposto, abrangendo desde fundamentos de CMS tradicionais até arquiteturas headless modernas e sistemas avançados de controle de acesso.

== Sistemas de Gerenciamento de Conteúdo (CMS)

Um Sistema de Gerenciamento de Conteúdo (ou CMS, da sigla em inglês Content Management System) é como um painel de controle para gerenciar o conteúdo de um site. Ele permite que pessoas sem conhecimento técnico possam criar, editar e publicar textos, imagens e vídeos em um site, sem precisar saber programação.

Pense no CMS como um editor de documentos, similar ao Microsoft Word, mas para sites. Em vez de precisar escrever código para adicionar uma nova notícia ou atualizar uma foto, você simplesmente usa uma interface visual, clica em botões e preenche formulários.

=== A Evolução dos CMS

Os CMS passaram por três fases importantes:

*Primeira Geração - Sites Estáticos*: No início da internet, qualquer mudança em um site exigia que um programador alterasse o código manualmente. Era como ter que chamar um engenheiro toda vez que você quisesse mudar a cor de uma parede da sua casa.

*Segunda Geração - CMS Tradicionais*: Surgiram sistemas como WordPress e Joomla, que tornaram a criação de sites muito mais fácil. Hoje, o WordPress é usado por mais de 40% de todos os sites do mundo. Esses sistemas são como blocos de montar: você escolhe um tema visual pronto, instala algumas extensões, e tem um site funcionando.

*Terceira Geração - CMS Headless (Modernos)*: É a fase atual, onde o sistema separa completamente o gerenciamento do conteúdo da apresentação visual. Isso dá muito mais liberdade para os desenvolvedores criarem diferentes tipos de interfaces.

=== Componentes Básicos de um CMS

Todo CMS moderno possui cinco partes essenciais:

1. *Painel Administrativo*: Onde você cria e edita o conteúdo (textos, imagens, vídeos)
2. *Banco de Dados*: Onde todas as informações são armazenadas de forma organizada
3. *Sistema de Publicação*: Que cuida de mostrar o conteúdo para os visitantes
4. *Controle de Acesso*: Que define quem pode ver ou editar cada coisa
5. *Conexões com Outros Sistemas*: Para integrar com redes sociais, sistemas de pagamento, etc.

=== Três Tipos de CMS

Hoje existem três categorias principais de CMS:

*CMS Tradicionais*: Como o WordPress, onde tudo vem junto em um pacote único. São fáceis de usar e instalar, mas têm limitações quando você precisa de algo mais personalizado ou quando o site cresce muito.

*CMS Headless (Desacoplados)*: Separam o gerenciamento de conteúdo da apresentação visual. É como ter uma biblioteca central de conteúdo que pode alimentar simultaneamente seu site, aplicativo de celular e até assistentes de voz. Oferece muito mais flexibilidade, mas é mais complexo de configurar.

*CMS Híbridos*: Combinam as duas abordagens, permitindo usar o sistema da forma tradicional ou moderna, conforme a necessidade do projeto.

== Controle de Acesso: Do Sistema de Papéis ao Sistema de Atributos

=== O Sistema Tradicional: RBAC (Controle Baseado em Papéis)

Imagine uma empresa onde existem diferentes cargos: gerente, editor e visitante. O sistema RBAC (sigla em inglês para Role-Based Access Control, ou "Controle de Acesso Baseado em Papéis") funciona exatamente assim - você atribui um "papel" ou "cargo" para cada usuário, e esse papel define o que a pessoa pode ou não fazer.

Por exemplo:
- Um *Gerente* pode criar, editar e excluir qualquer conteúdo
- Um *Editor* pode criar e editar, mas não excluir
- Um *Visitante* pode apenas visualizar

Esse sistema funcionou bem por muitos anos e ainda é amplamente usado. No entanto, ele tem três problemas principais:

*Explosão de Papéis*: Em empresas grandes, você acaba precisando criar muitos papéis diferentes. Por exemplo: "Editor de Notícias", "Editor de Esportes", "Editor de Tecnologia", "Editor Sênior de Notícias"... A lista cresce rapidamente e fica difícil de gerenciar.

*Falta de Flexibilidade com Contexto*: O RBAC não consegue criar regras como "Editores só podem publicar durante horário comercial" ou "Este conteúdo só pode ser acessado de dentro da empresa". Ele não considera a situação em que a pessoa está.

*Controle Limitado*: É difícil criar regras muito específicas, como "este usuário pode editar o título mas não o corpo do texto" ou "pode ver alguns campos mas não outros".

=== O Sistema Moderno: ABAC (Controle Baseado em Atributos)

O ABAC (Attribute-Based Access Control, ou "Controle de Acesso Baseado em Atributos") é uma evolução que resolve esses problemas. Em vez de simplesmente olhar o "cargo" da pessoa, o sistema analisa várias características ou "atributos" antes de decidir se permite ou não uma ação.

O ABAC considera quatro tipos de informação:

1. *Atributos da Pessoa*: Quem é o usuário (seu ID, cargo, departamento, há quanto tempo trabalha na empresa)
2. *Atributos do Conteúdo*: O que está sendo acessado (tipo de documento, quem criou, nível de confidencialidade, data de criação)
3. *Atributos da Ação*: O que a pessoa quer fazer (ler, editar, excluir, publicar)
4. *Atributos do Ambiente*: Em que situação (horário do dia, localização, tipo de dispositivo usado)

Com ABAC, você pode criar regras mais inteligentes como:

"Médicos podem acessar prontuários de pacientes do seu departamento, mas apenas durante o horário de trabalho e usando um dispositivo aprovado pelo hospital"

Essa regra seria extremamente difícil (ou impossível) de implementar com o sistema tradicional de papéis.

=== Como o ABAC Funciona

O sistema ABAC possui quatro componentes principais que trabalham juntos:

*Ponto de Decisão (PDP)*: É como um juiz que analisa as regras e decide se permite ou nega o acesso. Ele recebe informações sobre quem está tentando fazer o quê, consulta as políticas definidas e dá um veredicto: "permitido" ou "negado".

*Ponto de Aplicação (PEP)*: É como um guarda de segurança que intercepta toda tentativa de acesso. Quando alguém tenta fazer algo, o PEP para a requisição e pergunta ao PDP se pode permitir. Só depois da aprovação é que a ação acontece.

*Ponto de Informação (PIP)*: É como um banco de dados de informações. Quando o PDP precisa saber se o usuário pertence a determinado departamento ou se hoje é dia útil, ele busca essas informações no PIP.

*Ponto de Administração (PAP)*: É a interface onde os administradores criam e gerenciam as regras de acesso. Funciona como um painel de controle para definir quem pode fazer o quê e em que situação.

=== Por Que o ABAC é Melhor para Sistemas Modernos

O ABAC oferece quatro vantagens principais:

*Mais Expressivo*: Permite criar regras complexas e inteligentes em linguagem quase natural, considerando múltiplos fatores ao mesmo tempo.

*Mais Flexível*: As regras se adaptam automaticamente às mudanças. Se um funcionário muda de departamento, suas permissões mudam automaticamente sem precisar alterar configurações manualmente.

*Mais Granular*: Permite controlar o acesso em nível muito detalhado, até mesmo campo por campo em um formulário. Essencial para sistemas de gerenciamento de conteúdo onde diferentes informações têm diferentes níveis de sensibilidade.

*Mais Contextual*: Leva em conta a situação em que o acesso está acontecendo - horário, local, dispositivo - criando um sistema de segurança mais inteligente e adaptável.

=== Aplicações Práticas do ABAC em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo especificamente, o ABAC traz benefícios muito úteis:

*Controle de Horário de Publicação*: Você pode criar regras como "Artigos só podem ser publicados durante horário comercial e apenas por editores seniores". Isso evita publicações acidentais fora de hora.

*Personalização por Perfil*: Diferentes grupos de usuários podem ver conteúdos diferentes automaticamente, sem precisar criar versões separadas do sistema.

*Trabalho em Equipe por Projeto*: Quando alguém é adicionado a um projeto, ganha acesso automaticamente a todos os conteúdos relacionados. Quando sai do projeto, perde o acesso automaticamente.

*Conformidade com Leis de Privacidade*: Regulamentos como a LGPD (Lei Geral de Proteção de Dados) exigem controles específicos sobre dados pessoais. O ABAC permite criar essas proteções de forma automática e auditável.

== Arquitetura Headless: Separando a "Cabeça" do "Corpo"

=== O Que É um CMS Headless

Imagine que um site tradicional é como um boneco de ação: a cabeça (a parte visual que as pessoas veem) está permanentemente grudada no corpo (o banco de dados e a lógica). Se você quiser trocar apenas a cabeça, precisa desmontar tudo.

Um CMS Headless é diferente: a "cabeça" (frontend - a parte visual) está completamente separada do "corpo" (backend - onde os dados ficam). Eles conversam através de uma ponte chamada API (Interface de Programação de Aplicações). É como ter peças de LEGO que se encaixam mas podem ser trocadas independentemente.

=== API-First: Construindo Pela Ponte de Comunicação

O conceito "API-first" significa que, ao construir o sistema, a primeira coisa que criamos é essa "ponte de comunicação" (a API). É como construir primeiro as estradas antes de construir as cidades - garante que tudo possa se conectar bem depois.

Essa abordagem permite o "Content as a Service" (CaaS), ou "Conteúdo como Serviço". Pense no conteúdo como água em uma caixa d'água central: você pode conectar vários canos (sites, apps, dispositivos) nessa mesma fonte. Um único conteúdo alimenta múltiplas saídas.

=== Vantagens da Arquitetura Headless

*Liberdade Tecnológica*: Você pode usar as melhores ferramentas para cada parte. Quer fazer o site visual em React? O app de celular em Flutter? O painel administrativo em Vue? Todos podem usar os mesmos dados do backend.

*Escalabilidade Independente*: Se o site está recebendo muito tráfego, você pode aumentar apenas os recursos do frontend. Se precisa processar mais conteúdo, aumenta apenas o backend. É como poder expandir cômodos específicos da casa sem mexer nos outros.

*Reutilização Máxima de Conteúdo*: Escreva um conteúdo uma vez, use em todos os lugares. O mesmo artigo pode aparecer no site, no aplicativo de celular, em assistentes de voz (como Alexa), em smartwatches, em telas de aeroporto - tudo automaticamente.

*Estratégia Omnichannel*: Omnichannel significa "todos os canais". Você oferece uma experiência unificada para seus usuários em qualquer plataforma que eles escolham usar.

=== Desafios da Arquitetura Headless

Nem tudo são flores. A arquitetura headless traz alguns desafios:

*Complexidade Inicial Maior*: Configurar um sistema headless é mais complicado do que instalar um WordPress. Você precisa configurar o backend, depois o frontend, e garantir que eles conversem direito.

*Exige Mais Conhecimento Técnico*: Para usar um WordPress você pode aprender na hora. Para um sistema headless, você precisa entender conceitos de APIs, requisições HTTP, e como conectar sistemas diferentes.

*Coordenação Entre Equipes*: Se você tem uma equipe cuidando do backend e outra do frontend, elas precisam se comunicar constantemente para garantir que tudo funcione bem junto.

== GraphQL: Uma Forma Mais Inteligente de Buscar Dados

=== O Problema com APIs Tradicionais (REST)

Imagine que você vai a um restaurante e pede um prato específico. Com APIs REST tradicionais, é como se o garçom trouxesse a refeição completa mesmo que você só quisesse a salada. Ou então você precisasse fazer três pedidos diferentes para conseguir montar sua refeição completa - um pedido para o prato principal, outro para a bebida, outro para a sobremesa.

Isso causa dois problemas principais:
1. *Over-fetching*: Receber mais dados do que você precisa (desperdício de internet e processamento)
2. *Under-fetching*: Precisar fazer várias requisições separadas para conseguir todos os dados necessários (lentidão)

=== Como o GraphQL Resolve Isso

O GraphQL, criado pelo Facebook em 2015, funciona como um cardápio inteligente. Você diz exatamente o que quer, na quantidade que quer, e recebe apenas isso - tudo de uma vez só.

Com GraphQL, você faz uma única pergunta detalhada e recebe exatamente o que pediu. É como dizer ao garçom: "Quero o frango grelhado, mas só a carne e o molho, sem os legumes. E também quero suco de laranja sem gelo." E receber exatamente isso.

=== Características Principais do GraphQL

*Sistema de Tipos*: O GraphQL funciona como um contrato bem definido. Ele especifica exatamente que tipos de dados existem e o que você pode pedir. É como ter um cardápio detalhado que mostra todos os ingredientes disponíveis e como eles podem ser combinados.

*Ponto Único de Entrada*: Em vez de ter múltiplos endereços (URLs) diferentes para buscar dados, o GraphQL usa um único ponto de entrada. É como ter um balconista único que te ajuda com qualquer pedido, em vez de precisar ir a vários guichês diferentes.

*Consultas Flexíveis*: Você monta sua consulta pedindo exatamente os campos que precisa. Quer apenas o título e a data de um artigo? Peça só isso. Quer o artigo completo com autor e comentários? Também pode pedir tudo de uma vez.

=== GraphQL em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo, o GraphQL é especialmente útil porque:

*Adaptação a Diferentes Tipos*: O projeto usa "Union Types" (tipos unidos) que permitem que um campo possa conter diferentes tipos de dados - texto, número, data, imagem - e o GraphQL sabe lidar com cada um adequadamente.

*Filtros Inteligentes*: Você pode fazer buscas específicas:
- Em campos de texto: buscar coisas que "contêm" uma palavra, que "começam com" ou "terminam com" algo
- Em campos numéricos: buscar valores maiores que, menores que, iguais a um número
- Em campos de data: buscar conteúdos antes ou depois de uma data específica

*Performance Otimizada*: O sistema é inteligente o suficiente para transformar sua consulta GraphQL em comandos otimizados para o banco de dados, buscando apenas o necessário e filtrando direto na fonte.

== Modelagem de Dados Dinâmica e Flexível

A modelagem de dados para CMS que permitem definição dinâmica de tipos de conteúdo apresenta desafios únicos na engenharia de software. Segundo @kleppmann2017designing, sistemas que necessitam de flexibilidade de esquema devem balancear cuidadosamente entre performance de consultas e adaptabilidade estrutural.

O padrão Entity-Attribute-Value (EAV) tradicionalmente usado para esquemas dinâmicos apresenta limitações significativas em performance e complexidade de consultas. Para endereçar estas limitações, o sistema proposto implementa uma abordagem híbrida que combina tabelas tipadas para tipos de dados primitivos com armazenamento JSON para estruturas complexas.

A arquitetura de dados implementa estratégias diferenciadas baseadas na natureza dos tipos de dados:

*Tipos Primitivos*: Text, boolean, number e date_time são armazenados em tabelas dedicadas (entry_texts, entry_booleans, entry_numbers, entry_datetimes). Esta abordagem permite indexação eficiente e consultas otimizadas para operações comuns como busca textual e comparações numéricas.

*Tipos Complexos*: Object, text_list, number_list e json são armazenados na tabela unificada entry_json_data, aproveitando as capacidades nativas do PostgreSQL para dados semi-estruturados. O campo value_type permite distinguir entre diferentes estruturas JSON, mantendo type safety a nível de aplicação.

*Tipos Especiais*: Assets utilizam tabela de referência (entry_assets) para metadados de arquivos, enquanto rich_text implementa armazenamento dual (raw + rendered) para otimização de performance de renderização.

*Relacionamentos*: A tabela entry_relations gerencia referências entre entradas, suportando relacionamentos um-para-um, um-para-muitos e muitos-para-muitos através de configuração de campo.

== Frameworks e Padrões para Implementação de ABAC

Open Policy Agent emergiu como padrão de facto para implementação de ABAC em sistemas modernos. Conforme documentado por @styra2024opa, OPA oferece policy engine de propósito geral com linguagem declarativa Rego, arquitetura desacoplada Policy-as-Code e performance otimizada para milhares de autorizações por segundo.

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

A estrutura hierárquica do XACML inclui:
- *Rules*: Unidade básica de política com condição e efeito
- *Policies*: Conjunto de rules com algoritmo de combinação
- *PolicySets*: Container para policies com meta-políticas

Algoritmos de combinação como `deny-overrides` e `permit-overrides` resolvem conflitos sistematicamente, essencial para implementações robustas em sistemas enterprise.

*Casbin*: Biblioteca multi-linguagem que oferece ABAC simplificado usando structs/objetos, popular para implementações em Node.js e Python @casbin2024docs.

*AWS IAM com Tags*: Implementa ABAC nativamente usando tags como atributos, demonstrando escalabilidade enterprise em ambientes cloud @aws2024abac.

*Apache Ranger*: Framework abrangente para segurança de dados com suporte nativo para tag-based ABAC policies e integração com Apache Atlas @ranger2024docs.

== Segurança e Performance em Sistemas ABAC

A literatura identifica vulnerabilidades específicas do ABAC que exigem mitigação cuidadosa:

*Attribute Poisoning*: Atacantes manipulam atributos de entrada para obter acesso não autorizado. @avatier2024security demonstra mitigação através de verificação criptográfica de asserções e validação em tempo real.

*Inference Attacks*: Exploração de padrões comportamentais para inferir regras de políticas. Defendido por limitação da visibilidade de regras aplicáveis e obfuscação de decisões.

*Policy Conflicts*: Múltiplas políticas podem produzir decisões conflitantes. @oasis2013xacml especifica algoritmos formais para resolução, enquanto @combiningpolicies2009 analisa teoria e prática de combinação de políticas.

Benchmarks de performance mostram engines XACML modernos avaliando 10.000 requests em ~10 milissegundos @performance2024abac. Técnicas de otimização incluem:

*Smart Mask Ordering*: Reordenação de avaliação de atributos por probabilidade de decisão, resultando em 89% de melhoria de performance.

*Attribute Caching*: Cache distribuído de atributos frequentemente acessados, reduzindo latência de PIPs externos.

*Policy Indexing*: Estruturas de dados otimizadas para busca rápida de políticas aplicáveis baseada em atributos de contexto.

== Comparação com Outros Sistemas

Para entender melhor o que este projeto oferece, vamos comparar com outros sistemas de gerenciamento de conteúdo existentes no mercado.

=== WordPress: O Gigante Tradicional

O WordPress é o sistema de gerenciamento de conteúdo mais popular do mundo, usado por mais de 40% de todos os sites. Ele representa o modelo tradicional onde tudo vem em um pacote único.

*Pontos Fortes*: Fácil de usar, tem milhares de temas e plugins prontos, grande comunidade de suporte.

*Limitações*: Quando o site cresce muito ou precisa se integrar com aplicativos de celular, o WordPress mostra suas limitações. Ele não foi feito pensando em arquitetura headless, então usá-lo apenas como backend não é muito eficiente.

=== Joomla: O Meio-Termo

O Joomla é uma alternativa ao WordPress que oferece controle de usuários e permissões um pouco mais robusto, mas ainda mantém a estrutura tradicional onde tudo está acoplado.

=== Strapi: O Principal Concorrente Headless

O Strapi é o CMS headless open-source (código aberto) mais conhecido atualmente. Ele compartilha várias ideias com este projeto:

*Semelhanças*:
- Permite criar coleções de conteúdo personalizadas
- Oferece APIs GraphQL e REST
- Tem sistema de permissões baseado em papéis (roles)
- Suporta vários tipos de dados diferentes

*Diferenças Importantes*:

*Controle de Permissões*: O Strapi usa apenas o sistema tradicional RBAC (controle por papéis), que só permite definir permissões por tipo de conteúdo inteiro. Este projeto usa ABAC, permitindo controle muito mais fino - até mesmo por campo individual e considerando o contexto (horário, localização, etc.).

*Organização dos Dados*: Este projeto usa uma estratégia híbrida que organiza os dados de forma mais otimizada dependendo do tipo de informação, resultando em consultas mais rápidas.

*Regras Contextuais*: O Strapi não consegue criar regras como "só pode publicar durante horário comercial" ou "só pode acessar deste local". Este projeto implementa essas capacidades através do ABAC.

=== Casos de Uso no Mundo Real

Várias organizações grandes já usam sistemas com ABAC:

*Plataformas Educacionais*: Universidades usam ABAC para controlar quem pode acessar materiais de diferentes cursos, considerando matriculação, período letivo e outras variáveis.

*Gerenciadores de Conteúdo Corporativo*: Empresas como Adobe implementam controle baseado em metadados, aplicando automaticamente regras por departamento, região geográfica e nível de confidencialidade.

*Serviços de Streaming*: A Netflix utiliza sistemas de controle de acesso avançados para gerenciar permissões em sua arquitetura de microserviços de alta performance.

=== O Diferencial Deste Projeto

Analisando o mercado atual, este projeto preenche algumas lacunas importantes:

*ABAC Nativo em CMS Headless*: É raro encontrar CMS headless com controle de acesso baseado em atributos desde o início. Isso é valioso para organizações com necessidades complexas de segurança e compliance.

*Otimização para Performance*: A estratégia de armazenamento híbrida oferece vantagens de velocidade na avaliação de políticas de acesso em comparação com abordagens tradicionais.

*Segurança Contextual*: A capacidade de considerar hora do dia, localização, tipo de dispositivo e outros fatores contextuais nas decisões de acesso representa um nível de segurança mais moderno e adaptável.

== Frameworks Reativos Modernos

Os frameworks reativos modernos representam uma evolução significativa no desenvolvimento de interfaces de usuário, oferecendo diferentes abordagens para gerenciamento de estado e atualização de interfaces. Frameworks como React, SolidJS e Vue implementam paradigmas de reatividade que variam entre Virtual DOM e fine-grained reactivity.

Conforme documentado por @solidjs2024docs, frameworks como SolidJS utilizam "compilation-time optimizations para criar updates granulares que atingem apenas os nós DOM específicos que necessitam mudança", eliminando a necessidade de reconciliação completa de árvores de componentes.

Para aplicações de gerenciamento de conteúdo, as características dos frameworks reativos modernos oferecem vantagens específicas:

*Bundle Size Otimizado*: Frameworks como SolidJS oferecem runtime menor comparado a alternativas tradicionais, beneficiando dashboards administrativos que frequentemente incluem múltiplas bibliotecas especializadas.

*Performance Consistente*: A abordagem fine-grained reactivity oferece atualizações mais eficientes para interfaces que manipulam grandes volumes de dados, como listas de entradas de conteúdo ou árvores de categorias.

*Developer Experience*: A sintaxe baseada em JSX, comum a frameworks modernos, reduz a curva de aprendizado para desenvolvedores, facilitando migração e onboarding de equipes.

// ================================
// CAPÍTULO 3 - CONCEITO E DESIGN DO SISTEMA
// ================================

= Conceito e Design do Sistema

Este capítulo explica como o sistema foi pensado e construído, quais tecnologias foram escolhidas e por que, e como todas as partes trabalham juntas para criar uma solução completa de gerenciamento de conteúdo.

== Como o Sistema se Organiza

O sistema foi construído como peças de LEGO que se encaixam - cada parte tem sua função específica e conversam entre si através de conexões bem definidas. Vamos visualizar isso em três camadas principais:

#figure(
  image("diagramas/Diagrama do sistema.png", width: 100%),
  caption: [Estrutura do sistema mostrando como as três camadas principais se conectam]
) <fig-system-diagram>

=== As Três Camadas do Sistema

*Camada de Armazenamento (onde os dados ficam guardados)*:

Esta é como o arquivo ou biblioteca do sistema. Aqui ficam todos os dados guardados de forma segura e organizada. Usa duas tecnologias principais:

- *PostgreSQL*: Um banco de dados robusto que guarda todo o conteúdo, usuários, permissões - basicamente tudo que precisa ser permanente
- *Redis*: Um sistema de cache rápido que guarda informações temporárias, como sessões de usuários logados e decisões de acesso recentes, para tornar tudo mais rápido

*Camada de Comunicação (a ponte entre os dados e o usuário)*:

Esta camada funciona como um atendente que recebe pedidos, busca as informações necessárias e entrega de volta. Ela oferece:

- *GraphQL*: A interface principal, que permite fazer consultas flexíveis e receber exatamente os dados necessários
- *REST*: Usada para casos específicos como login e upload de arquivos, onde a abordagem REST é mais simples
- *Sistema de Segurança*: Verifica quem está fazendo cada pedido e se tem permissão para isso, usando o sistema ABAC que discutimos antes

*Camada de Interface (o que o usuário vê e interage)*:

Esta é a parte visual, onde administradores e editores de conteúdo trabalham. Inclui:

- *Painel Administrativo*: Interface moderna e responsiva construída em SolidJS
- *Sites dos Clientes*: Qualquer site ou aplicativo pode se conectar à API para consumir o conteúdo

=== Princípios de Design

O sistema foi construído seguindo quatro princípios importantes:

*Cada Parte Faz Uma Coisa*: Cada componente tem uma responsabilidade clara. O banco de dados apenas armazena, a API apenas comunica, a interface apenas apresenta. Isso torna mais fácil entender, consertar e melhorar cada parte.

*Partes Independentes*: As camadas conversam apenas através das APIs. Isso significa que você pode trocar ou atualizar uma parte sem quebrar as outras. É como ter tomadas padronizadas - você pode trocar qualquer aparelho desde que o plugue encaixe.

*Crescimento Inteligente*: Se muitas pessoas começam a acessar o site, você pode adicionar mais recursos apenas na parte visual. Se está criando muito conteúdo, aumenta apenas o backend. Cada parte cresce conforme sua necessidade específica.

*Liberdade de Escolha*: Desenvolvedores podem usar qualquer tecnologia que preferirem para criar a interface. Quer fazer o site em React? Em Vue? Em Angular? Todos podem usar os mesmos dados do backend.

== Tecnologias Escolhidas e Por Quê

Cada tecnologia foi escolhida por um motivo específico, buscando o equilíbrio entre performance, facilidade de uso e confiabilidade.

=== Backend (A Parte Invisível que Processa Tudo)

*Node.js com TypeScript*:

Node.js é como o motor do sistema, executando todo o código do servidor. Foi escolhido porque é muito eficiente para lidar com muitas requisições simultâneas - imagine um garçom que consegue atender várias mesas ao mesmo tempo.

TypeScript é uma "versão melhorada" de JavaScript que ajuda a evitar erros. É como ter um revisor que aponta possíveis problemas no código antes mesmo de executá-lo, tornando o desenvolvimento mais seguro e fácil de manter.

*PostgreSQL (Banco de Dados Principal)*:

Escolhido por ser extremamente confiável e poderoso. Três características importantes:
- Guarda dados de forma segura seguindo regras rígidas (padrões ACID) que garantem que nada se perde ou corrompe
- Consegue trabalhar tanto com dados estruturados (tabelas tradicionais) quanto com dados flexíveis (formato JSON)
- Oferece recursos avançados de busca e indexação que tornam as consultas muito rápidas

*Redis (Cache Rápido)*:

Funciona como uma memória de acesso rápido. Guarda informações temporárias que precisam ser acessadas rapidamente, como:
- Sessões de usuários logados (para não precisar verificar o banco de dados toda vez)
- Resultados de verificações de permissão recentes
- Qualquer dado que seja acessado frequentemente

*Drizzle ORM*:

É uma ferramenta que funciona como um tradutor entre o código TypeScript e o banco de dados PostgreSQL. Em vez de escrever comandos SQL complexos, você escreve em TypeScript de forma mais natural, e o Drizzle converte isso para comandos otimizados do banco de dados.

=== Frontend (A Interface Visual)

*SolidJS*:

Escolhido para criar o painel administrativo por três motivos principais:
- *Mais Rápido*: Atualiza apenas as partes da tela que realmente mudaram, sem redesenhar tudo
- *Mais Leve*: O tamanho final do código é menor, fazendo o site carregar mais rápido
- *Familiar*: Usa sintaxe JSX, conhecida por milhões de desenvolvedores que trabalham com React

=== Comunicação e APIs

*GraphQL*:

A interface principal para buscar dados. Como explicamos antes, permite que cada cliente peça exatamente os dados que precisa, nem mais nem menos, em uma única requisição.

=== Segurança

*Autenticação JWT com RSA*:

JWT (JSON Web Tokens) são como crachás digitais. Quando você faz login, recebe um token que comprova sua identidade. A criptografia RSA garante que esse token não pode ser falsificado - funciona como um selo de autenticidade impossível de copiar.

*Sistema de Sessões com Redis*:

Gerencia quanto tempo você fica logado no sistema. Características importantes:
- Desconecta automaticamente após um tempo de inatividade (por segurança)
- Pode estender automaticamente a sessão enquanto você está ativo
- Armazena decisões de permissão recentes para não precisar recalcular toda vez

*HTTPS/TLS (Conexão Criptografada)*:

Toda comunicação entre seu navegador e o servidor é criptografada. É como enviar cartas em envelopes lacrados e invioláveis - ninguém consegue espiar o conteúdo no caminho.


== Modelagem do Banco de Dados

O principal desafio na concepção do banco de dados é criar uma estrutura que suporte a definição dinâmica de tipos de conteúdo sem comprometer performance ou flexibilidade. A solução proposta utiliza uma abordagem híbrida que combina tabelas especializadas para tipos primitivos com armazenamento JSON para estruturas complexas.

=== Entidades Principais

*Collections (Coleções)*: Representa os tipos de conteúdo definidos pelos usuários. Cada coleção possui:
- Metadados básicos (nome, slug, descrição)
- Configurações visuais (ícone, cor)
- Suporte à internacionalização (locales suportados)
- Controle de criação e modificação

*Fields (Campos)*: Define os campos específicos de cada coleção com:
- Tipo de dados (enum com 12 tipos suportados)
- Validações (obrigatório, único)
- Metadados de apresentação (label, descrição)
- Configurações de segurança (sensibilidade, PII, criptografia)

*Entries (Entradas)*: Representa instâncias de conteúdo com:
- Status de publicação (DRAFT, PUBLISHED, ARCHIVED, DELETED)
- Controle de versioning e internacionalização
- Metadados de criação e modificação
- Sistema de slugs para URLs amigáveis

=== Estratégia de Armazenamento por Tipo

O sistema implementa diferentes estratégias de armazenamento baseadas na natureza dos tipos de dados:

*Tipos Primitivos* (text, boolean, number, date_time):
Armazenados em tabelas dedicadas (`entry_texts`, `entry_booleans`, `entry_numbers`, `entry_datetimes`) para permitir indexação eficiente e consultas otimizadas. Esta abordagem garante performance superior para operações de busca e filtragem.

*Tipo Typst* (typst_text):
Armazenado em tabela especializada (`entry_typst_texts`) que mantém tanto o código Typst original (`raw`) quanto a versão renderizada (`rendered`), permitindo edição e visualização eficientes do conteúdo tipográfico.

*Tipos Complexos* (text_list, number_list, json):
Armazenados na tabela unificada `entry_json_data`, aproveitando as capacidades nativas do PostgreSQL para dados semi-estruturados. O campo `value_type` distingue entre diferentes estruturas JSON mantendo type safety a nível de aplicação.

*Rich Text*:
Tabela `entry_rich_texts` com armazenamento triplo (raw + rendered + format) suportando múltiplos formatos (markdown, html, prosemirror) com sistema de renderização.

*Assets*:
Sistema de assets com tabela `entry_assets` incluindo ordenação múltipla, metadados de acessibilidade (alt text, caption) e integração com upload de arquivos.

*Relacionamentos*:
Sistema `entry_relations` gerenciando relacionamentos entre entradas com suporte a consultas GraphQL de relacionamentos aninhados.

=== Diagrama Entidade-Relacionamento

O diagrama ER apresentado na Figura 3.2 demonstra as principais entidades e seus relacionamentos:

#figure(
  image("diagramas/schema_database.png", width: 100%),
  caption: [Esquema completo do banco de dados PostgreSQL com todas as tabelas e relacionamentos]
) <fig-database-schema>

- Sistema de ownership tracking com 3 tipos de propriedade
- Schema ABAC completo com 8 tabelas para políticas e auditoria
- Índices estratégicos para performance otimizada

=== Principais Tabelas e Relacionamentos

#table(
  columns: (1.5fr, 1fr, 2fr),
  inset: 8pt,
  align: left,
  table.header([*Tabela*], [*Tipo*], [*Descrição*]),
  
  [`users`], [Principal], [Usuários com name, passwordHash e status],
  [`collections`], [Principal], [Definição de tipos de conteúdo],
  [`fields`], [Estrutural], [Campos com classificação de segurança],
  [`entries`], [Principal], [Instâncias de conteúdo com i18n],
  [`entry_texts`], [Dados], [Valores de campos de texto],
  [`entry_typst_texts`], [Dados], [Conteúdo Typst (raw + renderizado)],
  [`entry_booleans`], [Dados], [Valores booleanos],
  [`entry_numbers`], [Dados], [Valores numéricos],
  [`entry_datetimes`], [Dados], [Valores de data/hora],
  [`entry_rich_texts`], [Dados], [HTML/Markdown com formato],
  [`entry_json_data`], [Dados], [Estruturas complexas consolidadas],
  [`entry_assets`], [Referência], [Assets com ordenação múltipla],
  [`entry_relations`], [Referência], [Relacionamentos entre entradas],
  [`assets`], [Multimídia], [Arquivos com metadados de acessibilidade],
  [`abac_policies`], [Segurança], [Políticas de controle de acesso],
  [`abac_policy_rules`], [Segurança], [Regras específicas das políticas],
  [`abac_evaluation_cache`], [Performance], [Cache de decisões ABAC],
  [`abac_audit`], [Compliance], [Auditoria de decisões de acesso],
)

== Sistema de Controle de Acesso

O sistema implementa um sistema ABAC enterprise-grade nativo ao banco de dados, representando uma evolução significativa sobre modelos RBAC tradicionais. Esta abordagem oferece políticas declarativas, cache de performance e auditoria completa.

*Políticas ABAC* (`abac_policies`): Define políticas declarativas com efeito (ALLOW/DENY), prioridade para resolução de conflitos e conectores lógicos (AND/OR) para combinação de regras. Cada política especifica o tipo de recurso e ação que governa, com 15 ações granulares disponíveis.

*Regras de Política* (`abac_policy_rules`): Contém as condições específicas dentro de cada política, definindo caminhos de atributos tipados, operadores de comparação e valores esperados. Suporta 13 operadores diferentes incluindo comparações numéricas, matches de string e verificações de arrays.

*Cache de Avaliação* (`abac_evaluation_cache`): Sistema de cache de alta performance que armazena resultados de avaliação com TTL configurável, incluindo métricas de tempo de execução e invalidação baseada em checksum de contexto.

*Auditoria Completa* (`abac_audit`): Log detalhado de todas as decisões de autorização incluindo contexto da requisição, políticas avaliadas, tempo de execução e razão da decisão para compliance e debugging.

O sistema define 28 caminhos de atributos tipados através do enum `attribute_path`:

*Atributos do Sujeito* (4 atributos):
- `subject.id`, `subject.role`, `subject.status`, `subject.createdAt`

*Atributos de Recursos*:
- Coleções (4 atributos): `resource.collection.id`, `resource.collection.slug`, `resource.collection.createdBy`, `resource.collection.isLocalized`
- Entradas (6 atributos): `resource.entry.id`, `resource.entry.status`, `resource.entry.createdBy`, `resource.entry.collectionId`, `resource.entry.locale`, `resource.entry.publishedAt`
- Campos (7 atributos): `resource.field.id`, `resource.field.name`, `resource.field.dataType`, `resource.field.sensitivityLevel`, `resource.field.isPii`, `resource.field.isPublic`, `resource.field.collectionId`
- Assets (4 atributos): `resource.asset.id`, `resource.asset.uploadedBy`, `resource.asset.mimeType`, `resource.asset.fileSize`

*Atributos Ambientais* (3 atributos):
- `environment.currentTime`, `environment.ipAddress`, `environment.userAgent`

*Atributos de Ação* (1 atributo):
- `action.type` com 15 ações específicas: create, read, update, delete, publish, unpublish, schedule, archive, restore, draft, ban, unban, activate, deactivate, upload, download, transform, configure_fields, manage_schema

Os campos implementam classificação automática de sensibilidade através do campo `sensitivityLevel` com quatro níveis:

*PUBLIC*: Dados públicos sem restrições
*INTERNAL*: Dados internos da organização
*CONFIDENTIAL*: Dados sensíveis com acesso restrito
*RESTRICTED*: Dados altamente sensíveis com máxima proteção

Campos podem ser marcados como PII (`isPii`) e criptografados (`isEncrypted`), permitindo políticas específicas baseadas na classificação de dados.

A tabela `resource_ownerships` rastreia propriedade de recursos com três tipos:

*CREATOR*: Ownership automático baseado em criação
*ASSIGNED*: Ownership explicitamente atribuído por administradores
*INHERITED*: Ownership herdado de recursos pais

Este sistema permite políticas dinâmicas baseadas em propriedade com suporte a expiração temporal.

*Cache Multi-Layer*: Sistema de cache com invalidação inteligente baseada em checksum de contexto e versões de políticas, proporcionando latência sub-milissegundo para avaliações frequentes.

*Índices Estratégicos*: 15+ índices específicos otimizam consultas por usuário, recurso, ação e tempo, garantindo performance escalável.

*Métricas de Performance*: Cada avaliação inclui tempo de execução para identificação de políticas lentas e otimização contínua.

*Sistema de Prioridade*: Políticas possuem prioridade numérica para resolução determinística de conflitos entre ALLOW e DENY.

*Conectores Lógicos*: Políticas podem usar AND (todas as regras devem ser verdadeiras) ou OR (qualquer regra verdadeira) para flexibilidade na definição de condições.

*Deny-by-Default*: Sistema segue princípio de menor privilégio onde acesso é negado por padrão, requerindo políticas explícitas ALLOW.

O sistema suporta políticas sofisticadas como:

"ALLOW READ em campos com sensitivityLevel='PUBLIC' OR (sensitivityLevel='INTERNAL' AND subject.role IN ['editor', 'admin'] AND environment.currentTime BETWEEN 09:00-17:00) DENY se field.isPii=true AND NOT subject.hasPrivacyTraining"

Esta política combina múltiplas dimensões de atributos para controle granular baseado em contexto dinâmico.

== APIs e Protocolos de Comunicação

A API REST é projetada especificamente para dois casos de uso onde simplicidade e compatibilidade são prioritárias:

*Autenticação* (`/auth`): Endpoints para login, logout, refresh de tokens JWT e recuperação de senha. Esta implementação REST garante compatibilidade ampla com diferentes clientes e simplicidade na integração.

*Gerenciamento de Assets* (`/assets`): Operações CRUD para arquivos multimídia, incluindo upload, download, streaming e metadados. A natureza binária dos assets e necessidades de streaming tornam REST mais apropriado que GraphQL.

*Características Técnicas*:
- Métodos HTTP apropriados: GET (leitura), POST (criação/upload), PUT/PATCH (atualização), DELETE (remoção)
- Códigos de status consistentes: 200 (sucesso), 201 (criado), 400 (erro cliente), 401 (não autenticado), 403 (não autorizado), 404 (não encontrado), 500 (erro servidor)
- Content-Type diversificado: multipart/form-data para uploads, application/json para metadados

A implementação GraphQL serve como interface principal oferecendo flexibilidade superior para consultas complexas:

*Esquema*: O esquema GraphQL foi desenvolvido para facilitar o uso do sistema, as queries e mutations são formuladas de modo que o usuario não precise fazer relações manualmente.

*Union Types para Flexibilidade*: Utilização de Union Types para representar diferentes tipos de campos (`FieldValue`), mantendo type safety para diferentes estruturas de dados:

```graphql
union FieldValue = Text | TypstText | Asset | BooleanValue | 
                   NumberValue | DateTime | RichText | Json | Relation
```

*Sistema de Filtering Avançado*: Implementação de filtros específicos por tipo de dado:
- Campos de texto: `contains`, `startsWith`, `endsWith`, `equals`
- Campos numéricos: `gt`, `gte`, `lt`, `lte`, `equals`
- Campos de data: `before`, `after`, `equals`
- Campos booleanos: `equals`
- Relacionamentos: `exists`, `in`, `notIn`

*Resolvers Otimizados*: Implementação de resolvers que aplicam filtros diretamente no banco de dados através de consultas SQL otimizadas, evitando over-fetching.

*Paginação e Ordenação*: Suporte nativo a cursor-based pagination e ordenação multi-campo para consultas eficientes de grandes datasets.

*Exemplo de Query Complexa*: O sistema suporta consultas sofisticadas que combinam metadados de coleção com filtragem de conteúdo:

```graphql
query ($name: String!, $fieldName2: String!) {
  collection(name: $name) {
    name
    fields {
      name
      dataType
    }
    entries {
      name
      test_field: field(name: $fieldName2, filter: { text: { eq: "wow!" } }) {
        ... on Text {
          text
        }
      }
    }
  }
}
```

Esta query demonstra a capacidade de buscar uma coleção específica, listar seus campos e metadados, e simultaneamente filtrar entradas baseando-se no valor de campos específicos, tudo em uma única requisição otimizada.

*Higher-Order Functions*: Sistema de proteção automática através de:
- `withAuth`: HOF que protege resolvers automaticamente
- `filterByPermission`: Função para filtragem ABAC de resultados
- `requirePermission`: Middleware para verificação de permissões
- `requireFieldPermission`: Sistema para controle field-level

*GraphQL Error Handling*: Tratamento padronizado de erros de autenticação e autorização com códigos HTTP apropriados.

== Interface Administrativa

A interface administrativa utiliza SolidJS, oferecendo arquitetura reativa moderna:

*Reatividade Fine-Grained*: Atualizações cirúrgicas do DOM apenas nos elementos que efetivamente mudaram, eliminando reconciliação desnecessária.

*Bundle Size Otimizado*: Aplicação administrativa com tamanho reduzido comparado a frameworks tradicionais.

*Type Safety Completa*: Integração TypeScript end-to-end garantindo consistência entre frontend e backend.

*Schema Adaptativo*: Interface que se adapta automaticamente aos tipos de campos definidos nas coleções, oferecendo widgets específicos para cada tipo de dados.

*Dashboard Principal*: Interface central oferecendo visão geral das coleções, estatísticas de uso e navegação baseada em permissões ABAC.

*Editor de Coleções*: Interface para definição dinâmica de tipos de conteúdo com preview em tempo real e validação de schemas.

*Editor de Entradas*: Interface completamente adaptativa que gera formulários baseados no schema da coleção, com widgets específicos e validação em tempo real.

*Gerenciador de Assets*: Sistema completo para upload, organização e metadados de arquivos multimídia, incluindo preview e campos de acessibilidade.

*Sistema de Permissões*: Interface administrativa para configuração granular de políticas de permissoes.


== Segurança e Performance

*Autenticação por Nome de Usuário*: Sistema baseado nos campos `name` e `passwordHash` da tabela users, com status de conta controlado pelo enum `user_status`.

*Sistema de Sessões Seguro*: Gerenciamento com TTL configurável, extensão automática e cache Redis para performance.

*Validação Rigorosa*: Validação de inputs via JSON Schema, sanitização de dados e queries SQL seguras via Drizzle ORM.

*Encryption at Rest*: Suporte a criptografia de campos sensíveis através do flag `isEncrypted`.

*Database Indexing*: Estratégia abrangente com 15+ índices específicos incluindo índices compostos para consultas ABAC.

*Connection Pooling*: Gerenciamento otimizado de conexões PostgreSQL.

*GraphQL Optimizations*: DataLoader para batching de consultas e prevenção do problema N+1.
