
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Chan Sherwin Stephen"
#let locale-catalog-page-numbering-style = context { "Chan Sherwin Stephen - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
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

= Chan Sherwin Stephen

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Singapore],
  [#box(original-link("mailto:sherwin0402@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)sherwin0402\@gmail.com])],
  [#box(original-link("https://sherwin0402.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)sherwin0402.github.io])],
  [#box(original-link("https://linkedin.com/in/sherwin-chan")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)sherwin-chan])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Final-year Ph.D. student at NTU \(expected completion Feb 2026\) specializing in physics-based simulation of physical human–robot interaction \(pHRI\) for assistive robots. Develops realistic digital human twins and personalized controllers in MuJoCo within a Real2Sim2Real workflow to study safe, intuitive HRI. Currently building an Embodied AI data factory for scalable, high-fidelity teleop data that trains robust, generalizable VLA\/FM policies.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], Singapore

#strong[#strong[Ph.D.] in #strong[Mechanical Engineering]]
  ],
  right-content: [
    Aug 2021 -- Feb 2026 \(Expected\)
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[Advisor:] Prof Ang Wei Tech],[#strong[Proposed Dissertation:] Human-in-the-Loop Simulation for Adaptive Assistive Robots: Personalising Human Models and Robot Control],[#strong[Research Interests:] Physics-Based Simulation, Human-Robot Interaction, Machine Learning, Foundation Models, Large Language Models],)
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
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], Singapore

#strong[#strong[B.E.] in #strong[Mechanical Engineering] with a Specialization in Robotics and Mechatronics]
  ],
  right-content: [
    Aug 2017 – May 2021
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.84\/5.00, First Class Honours],[Dean's List for 2017\/2018 \(Top 5\% of Cohort\)],[#strong[Awards:] Nanyang Scholarship],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Research Projects


#two-col-entry(
  left-content: [
    #strong[Embodied AI Data Factory] 
  ],
  right-content: [
    July 2025 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Leading the development of a next-generation teleoperation framework for whole-body, dual-arm, and dexterous manipulation, optimised to lower operator cognitive load and preserve natural human motion.],[Building a scalable, end-to-end data generation pipeline that fuses markerless motion capture, multi-sensor perception, and real-time retargeting for both physical humanoids and simulated agents.],[Advancing methods to bridge the embodiment gap between human demonstrations and robot execution, enabling high-throughput collection of richly annotated datasets for training robust, foundation model–based vision-language-action \(VLA\) policies.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Human-In-The-Loop Robotic Simulator] 
  ],
  right-content: [
    Sept 2021 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Led development of a human-in-the-loop simulation framework for assistive robotics, with personalized digital twins across abilities. The pipeline integrates skeletal, musculoskeletal, and soft-body models, using reinforcement learning to simulate diverse capabilities and enable realistic, adaptive robot testing.],[Designed and validated a Real2Sim2Real framework to personalize robotic controllers for robot-assisted feeding and gait-assistive robots, enabling improved pHRI through simulation-informed adaptation and real-world testing.],[Investigated various human-robot interaction modalities in simulation, including soft body interaction dynamics, mass-spring-damper models, and other methods to accurately represent physical interactions.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mobile Third Arm Robot] 
  ],
  right-content: [
    2020 -- 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and developed a complete vision guided mobile third arm cobot to assist caregivers in moderate assisted pivot transfers between a bed and wheelchair, covering mechanical design, electronics integration, and control systems.],[Implemented a human-tracking computer vision algorithm and developed human-robot interaction strategies to enable safe, intuitive operation between the caregiver, patient, and mobile third arm robot.],)
  ],
)



== Work Experience


#two-col-entry(
  left-content: [
    #strong[Project Officer], Nanyang Technological University, Singapore -- Singapore
  ],
  right-content: [
    Aug 2021 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Mentored seven final-year project students and collaborated with cross-functional research teams, including biomechanics experts, therapists, engineers, and research leads, to advance the development and application of the simulator.],[Prepared funding proposals ranging from small grants of SGD 200K to large multi-institutional proposals of over SGD 3 million \(currently under review\) to support ongoing and upcoming research initiatives.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Engineering Intern], #link("https://oishii.com/")[Oishii] -- New Jersey, USA
  ],
  right-content: [
    June 2019 – June 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed an indoor vertical farm structure accommodating 250,000 plants with a novel rack system that increases efficiency of construction and assembly process by 90\%.],[Pioneered development of a USD 400,000 R&D facility consisting of ten independent growing environments tracking more than 80 plant parameters to determine optimal plant growth and yield.],[Led an engineering team of 12 to implement testing and troubleshooting schedule to all farm sub-systems as lead test engineer to bring the world’s largest indoor strawberry vertical farm facility operational.],[Evaluated 32 engineering candidates for engineering roles, mentored 19 new engineering technicians to improve mechanical and electrical skillsets and align with company working norms.],)
  ],
)



== Selected Publications


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

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\), † Denotes equal contribution])

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

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Robotics and Automation \(ICRA\), † Denotes equal contribution])

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

#v(design-highlights-top-margin - design-text-leading)International Conference on Social Robotics \(ICSR\)])

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



== Skills


#one-col-entry(
  content: [#strong[Programming Languages:] Python, C++, C]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Robotics:] MuJoCo, OpenSim, Reinforcement Learning, Machine Learning \(PyTorch, TensorFlow\), Isaac Lab \(Gym\), ROS, SolidWorks, SolidEdge, STM32, ESP32, Linux]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Spoken Languages:] English, Chinese, Hokkien \(Dialect\), Tagalog]
)


== Awards and Achievements


#two-col-entry(
  left-content: [
    #strong[Dyson-NTU Innovation Challenge] -- #strong[Singapore]
  ],
  right-content: [
    2021-04 -- 2021-09
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Won 1st place in the annual innovation challenge organized by NTUitive.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Awarded SGD 10,000 MDT grant to prototype a innovative smart planter to address urban gardening challenges],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Overseas Entrepreneurship Program \(OEP\) Pitch Day Award] -- #strong[Singapore]
  ],
  right-content: [
    2020-09 -- 2021-02
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Founded HortiCole startup and secured funding for IoT agricultural solution.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Awarded SGD 5,000 to develop a low-cost, modular IoT planter system with alpha prototype in 6 months],[Conducted market research and received strong market validation of 64.5\% from 400 participants],)
  ],
)



