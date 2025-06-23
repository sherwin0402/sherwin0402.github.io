
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "陈健怡"
#let locale-catalog-page-numbering-style = context { "陈健怡 - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 6cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
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



== 自我介绍


#one-col-entry(
  content: [我是一名新加坡南洋理工大学（NTU）的博士毕业年学生，在洪伟德教授（Prof. Ang Wei Tech）指导下，专注于辅助与康复设备中的物理人机交互仿真研究。我主要使用 MuJoCo 平台，构建融合骨骼、肌肉骨骼与软体模型的数字人体，并设计 Real2Sim2Real 框架，实现个性化机器人控制策略。我的研究结合仿真驱动的机器学习，旨在开发安全直观的交互策略，推动智能物理交互系统的发展。目前，我也在探索将基础模型与大语言模型（Foundation & Large Language Models）融入仿真中，以提升人机交互的真实性、理解能力与泛化性。]
)


== 教育背景


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[南洋理工大学]], 新加坡

#strong[博士 -- 机械工程]
  ],
  right-content: [
    2021年9月 -- 2025年8月\(预计\)
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[导师：] 洪伟德教授\(Prof Ang Wei Tech\)],[#strong[拟定论文题目：] 通过精确的人机闭环仿真，加速辅助机器人的发展],[#strong[研究方向：] 基于物理的仿真、人机交互、机器学习、基础模型，大语言模型],)
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

#strong[本科 -- 机械工程（机器人与机电一体化方向）]
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
    #strong[人机闭环仿真平台\(Human-In-The-Loop Robotic Simulator\)] 
  ],
  right-content: [
    2021年9月 -- 至今
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [一个用于物理人机交互（pHRI）研究的仿真框架，以实现机器人系统的个性化。])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([开发了一套用于辅助机器人研究的人机闭环仿真框架，支持构建具备不同能力与障碍的个性化数字人体。该流程集成了骨骼、肌肉骨骼与软体模型，并使用强化学习模拟多样化的人体能力，实现真实、可适应的交互测试。],[设计并验证了 Real2Sim2Real 框架，依据个体用户特征个性化调整机器人控制器，通过仿真辅助实现更优的物理人机交互，并可在现实中进行验证。],[在仿真中探索多种人机交互建模方式，包括软体动力学、质量-弹簧-阻尼系统等，以准确还原物理交互特性。],[使用 MuJoCo 平台模拟多种辅助机器人系统，包括机器人辅助喂食机械臂、上下肢外骨骼、步态辅助机器人等。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[移动式第三机械臂机器人\(Mobile Third Arm Robot\)] 
  ],
  right-content: [
    2020年8月 -- 2021年5月
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [一种用于病患从床到轮椅转移的视觉引导型移动第三机械臂协作机器人。])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([开发了一款移动式第三机械臂机器人，协助护理人员完成从床到轮椅的中度辅助枢轴转移操作。],[实现了基于计算机视觉的人体追踪算法，用于跟随用户行动。],[设计了人与机器人之间的交互策略，确保在护理人员、病患与机械臂之间的协作过程中操作直观且安全。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[水下机器人系统的设计与分析\(Design and Analysis of Underwater Robotic Systems\)] 
  ],
  right-content: [
    2018 -- 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [采用3D打印技术制造的水下机械臂，用于抓取水池底部的物体。])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([为自主水下航行器设计并3D打印了水下机械臂，用于抓取水池底部的物体。],[设计了一种仿生柔性艇体结构，能随着水深变化变形，以增强刚性并降低整体重量。],[进行了有限元分析，优化机械臂与艇体结构的强度、水动力性能及最大工作深度。],)
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
    #v(design-highlights-top-margin);#highlights([主导人机闭环仿真平台项目，开发结合高保真人体数字模型与辅助机器人的仿真平台，用于研究人机交互。],[指导7名本科生完成毕业设计，协助其进行研究工作并提供技术支持。],[协助撰写研究资金提案，支持研究院当前及未来项目的发展。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[工程实习生], #link("https://oishii.com/")[Oishii] -- 新泽西州，美国
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



== 出版物


#two-col-entry(
  left-content: [
    #strong[ORBiT: Optimizing Robot-Assisted Bite Transfer Leveraging a Real2Sim2Real Framework]

  ],
  right-content: [
    Oct 2025
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
    May 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Yifan Wang†, #strong[#emph[Sherwin Stephen Chan†]], Mingyuan Lei, Lek Syn Lim, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Robotics and Automation \(ICRA\), † 贡献相同])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Simulating Safe Bite Transfer in Robot-Assisted Feeding with a Soft Head and Articulated Jaw]

  ],
  right-content: [
    May 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Yi Heng San†, Vasanthamaran Ravichandram†, J Anne Yow†, #strong[#emph[Sherwin Stephen Chan†]], Yifan Wang, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Rehabilitation Robotics \(ICORR\), † 贡献相同])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Personalised 3D Human Digital Twin with Soft-Body Feet for Walking Simulation]

  ],
  right-content: [
    Dec 2024
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
    Sept 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[Sherwin Stephen Chan]], Mingyuan Lei, Henry Johan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Rehabilitation Robotics \(ICORR\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Investigation of Modeling Differences between OpenSim and Visual3D for Gait Analysis of Healthy Gait]

  ],
  right-content: [
    Aug 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Beth Eng Wan Xuan, #strong[#emph[Sherwin Stephen Chan]], Henry Johan, Lek Syn Lim, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Convention on Rehabilitation Engineering and Assistive Technology])



== 技能


#one-col-entry(
  content: [#strong[编程语言:] Python, C++, C]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[机器人:] MuJoCo, OpenSim, Machine Learning, Reinforcement Learning, IsaacLabs, ROS, SolidWorks, SolidEdge, STM32, ESP32, Linux]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[语言能力:] 英语、中文、福建话（方言）、菲律宾语]
)


