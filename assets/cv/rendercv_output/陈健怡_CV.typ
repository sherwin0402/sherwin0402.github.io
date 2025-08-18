
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "陈健怡"
#let locale-catalog-page-numbering-style = context { "陈健怡 - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.3em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.8pt
#let design-section-titles-font-size = 1.3em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.6cm
#let design-section-titles-vertical-space-below = 0.4cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.65em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "·"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.3cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.4em
#let design-entries-vertical-space-between-entries = 0.5cm
#let design-entries-date-and-location-width = 6cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.15cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= 陈健怡

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)新加坡 | 微信: chenjianyi0402],
  [#box(original-link("mailto:sherwin0402@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)sherwin0402\@gmail.com])],
  [#box(original-link("https://sherwin0402.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)sherwin0402.github.io])],
  [#box(original-link("https://linkedin.com/in/sherwin-chan")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)sherwin-chan])],
)
#connections(connections-list)



== 概要


#one-col-entry(
  content: [南洋理工大学博士最后一年学生（预计2026年2月毕业），专注于辅助机器人的物理人机交互仿真。开发基于MuJoCo的真实感数字人体与个性化控制器，采用Real2Sim2Real框架研究安全、直观的人机交互。目前构建人形机器人数据工厂，生成高保真远程操作数据以训练强大的视觉-语言-动作模型。]
)


== 教育背景


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[南洋理工大学]], 新加坡

#strong[#strong[博士] -- #strong[机械工程]]
  ],
  right-content: [
    2021年8月 -- 2026年2月（预计
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[导师：] 洪伟德教授 \(Prof Ang Wei Tech\)],[#strong[论文题目：] Human-in-the-Loop Simulation for Adaptive Assistive Robots: Personalising Human Models and Robot Control],[#strong[研究领域：] 基于物理的仿真 · 人机交互 · 机器学习 · 基础模型 · 人形机器人],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[南洋理工大学]], 新加坡

#strong[#strong[本科] -- #strong[机械工程]（机器人与机电一体化方向）]
  ],
  right-content: [
    2017年8月 -- 2021年5月
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[绩点:] 4.84\/5.00, 学年入选院长名单 \(Dean's List\) 2017\/2018],[#strong[奖项:] 南洋奖学金 \(Nanyang Scholarship\)],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== 研究项目


#two-col-entry(
  left-content: [
    #strong[#strong[人形机器人数据工厂] \(Humanoid\/Embodied AI Data Factory\)] 
  ],
  right-content: [
    2025年7月 -- 至今
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [构建可扩展的端到端数据生成平台，支持高保真操作和类人形数据采集])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([主导开发下一代远程操作框架，用于全身、双臂和灵巧操作，优化以降低操作员认知负荷并保持自然人体运动。],[构建可扩展的端到端数据生成管道，融合无标记动作捕捉、多传感器感知和实时重定向，支持物理类人形机器人和仿真代理。],[推进方法以缩小人类演示和机器人执行之间的具身差距，实现高通量收集丰富标注的数据集，用于训练强大的基于基础模型的视觉-语言-动作（VLA）策略。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[人机闭环仿真平台\(Human-In-The-Loop Robotic Simulator\)] 
  ],
  right-content: [
    2021年9月 -- 至今
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [物理人机交互研究的仿真框架，实现机器人系统个性化])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([主导开发了一套用于辅助机器人研究的人机闭环仿真框架，具备跨能力的个性化数字孪生。该管道集成骨骼、肌肉骨骼和软体模型，使用强化学习模拟多样化能力，实现真实、自适应的机器人测试。],[设计并验证了 Real2Sim2Real 框架，用于个性化调整机器人控制器，已应用于机器人辅助喂食与步态辅助机器人，通过仿真驱动的适应和现实世界测试改善人机交互。],[研究了仿真中的各种人机交互模式，包括软体交互动力学、质量-弹簧-阻尼模型和其他方法，以准确表现物理交互。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[移动式第三机械臂机器人\(Mobile Third Arm Robot\)] 
  ],
  right-content: [
    2020年 -- 2022年
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [视觉引导的移动协作机器人，辅助护理人员完成患者转移])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([设计并开发了一套完整的视觉引导移动第三机械臂协作机器人，用于协助护理人员完成从床到轮椅的中度辅助枢轴转移，涵盖机械设计、电子集成与控制系统。],[实现了基于计算机视觉的人体追踪算法，并开发了人机交互策略，以确保护理人员、患者和移动第三机械臂机器人之间的安全、直观操作。],)
  ],
)



== 工作经历


#two-col-entry(
  left-content: [
    #strong[项目主管], 南洋理工大学 -- 新加坡
  ],
  right-content: [
    2021年8月 -- 至今
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([指导7名本科毕业设计学生，与跨学科团队协作推进仿真平台开发],[撰写研究资金提案，金额从20万至300万新元，支持多项科研计划],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[工程实习生], #link("https://oishii.com/")[Oishii] -- 美国新泽西州
  ],
  right-content: [
    2019年6月 -- 2020年6月
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([设计了一套室内垂直农场结构，可容纳25万株植物，并采用创新托架系统，将建造与组装效率提升了90\%。],[主导开发了价值40万美元的研发设施，包含10个独立生长环境，追踪超过80项植物参数，以优化生长与产量。],[作为主测试工程师，带领12人工程团队制定测试与故障排查流程，成功推动全球最大草莓室内垂直农场投入运营。],[参与筛选32名工程职位候选人，并指导19位新进技术人员，提升其机械与电气技能，同时协助其融入公司工作规范。],)
  ],
)



== 精选出版物


#two-col-entry(
  left-content: [
    #strong[ORBiT: Optimizing Robot-Assisted Bite Transfer Leveraging a Real2Sim2Real Framework]

  ],
  right-content: [
    2025年10月
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Sherwin Stephen Chan†]], J Anne Yow†, Yi Heng San, Vasanthamaran Ravichandram, Yifan Wang, Lek Syn Lim, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\), † 贡献相同])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Human-In-The-Loop Simulation Framework for Evaluating Control Strategies in Gait Assistive Robots]

  ],
  right-content: [
    2025年5月
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Yifan Wang†, #strong[#emph[Sherwin Stephen Chan†]], Mingyuan Lei, Lek Syn Lim, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Robotics and Automation \(ICRA\), † 贡献相同])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Personalised 3D Human Digital Twin with Soft-Body Feet for Walking Simulation]

  ],
  right-content: [
    2024年12月
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Kum Yew Loke, #strong[#emph[Sherwin Stephen Chan]], Mingyuan Lei, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Conference on Social Robotics])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Creation and evaluation of human models with varied walking ability from motion capture for assistive device development]

  ],
  right-content: [
    2023年9月
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Sherwin Stephen Chan]], Mingyuan Lei, Henry Johan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Rehabilitation Robotics \(ICORR\)])



== 奖项与成就


#two-col-entry(
  left-content: [
    #strong[Dyson-NTU创新挑战赛] -- #strong[新加坡]
  ],
  right-content: [
    2021年4月 -- 2021年9月
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [NTUitive主办的年度创新竞赛第一名])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([获得10,000新元MDT资助，开发智能园艺解决方案],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[OEP创业竞赛奖] -- #strong[新加坡]
  ],
  right-content: [
    2020年9月 -- 2021年2月
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [创立HortiCole获得物联网农业解决方案资助])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([获得5,000新元资助开发模块化IoT种植系统],[市场调研显示64.5\%强烈需求验证（400人参与）],)
  ],
)



== 技能


#one-col-entry(
  content: [#strong[编程语言:] Python, C++, C]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[机器人:] MuJoCo, OpenSim, Machine Learning, Reinforcement Learning, IsaacLabs, ROS, SolidWorks, SolidEdge]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[语言能力:] 英语、中文、福建话（方言）、菲律宾语]
)


