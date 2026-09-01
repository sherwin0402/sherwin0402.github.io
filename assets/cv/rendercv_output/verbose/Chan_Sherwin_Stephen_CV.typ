
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Chan Sherwin Stephen"
#let locale-catalog-page-numbering-style = context { "Chan Sherwin Stephen - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Sept 2026"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
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
#let design-section-titles-vertical-space-above = 0.6cm
#let design-section-titles-vertical-space-below = 0.35cm
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
#let design-highlights-vertical-space-between-highlights = 0.2cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.5cm
#let design-entries-date-and-location-width = 6cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
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
  [#box(original-link("https://github.com/sherwin0402")[#fa-icon("github", size: 0.9em) #h(0.05cm)sherwin0402])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Final-year Ph.D. student at NTU \(expected completion Feb 2026\) specializing in physics-based simulation of physical human-robot interaction \(pHRI\) for assistive robots. Develops realistic digital human twins and personalized controllers in MuJoCo within a Real2Sim2Real workflow to study safe, intuitive HRI. Currently building an Embodied AI data factory for scalable, high-fidelity teleoperation data that trains robust, generalizable VLA\/FM policies.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], #strong[Ph.D.] in #strong[Mechanical Engineering] -- Singapore
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[Advisor:] Prof Ang Wei Tech],[#strong[Proposed Dissertation:] Human-in-the-Loop Simulation for Adaptive Assistive Robots: Personalising Human Models and Robot Control],[#strong[Research Interests:] Physics-Based Simulation, Human-Robot Interaction, Machine Learning, Foundation Models, Large Language Models],)
  ],
  right-content: [
    Aug 2021 -- Feb 2026 \(Expected\)
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], #strong[B.E.] in #strong[Mechanical Engineering] with a Specialization in Robotics and Mechatronics -- Singapore
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.84\/5.00, First Class Honours],[#strong[Awards:] Nanyang Scholarship, Dean's List for 2017\/2018 \(Top 5\% of Cohort\)],)
  ],
  right-content: [
    Aug 2017 – May 2021
  ],
)



== Research Projects


#two-col-entry(
  left-content: [
    #strong[Embodied AI Data Factory] 
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A scalable, end-to-end data generation platform for high-fidelity teleoperation and humanoid data collection.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Leading the development of a next-generation teleoperation framework for whole-body, dual-arm, and dexterous manipulation, optimized to lower operator cognitive load and preserve natural human motion.],[Building a scalable, end-to-end data generation pipeline that fuses markerless motion capture, multi-sensor perception, and real-time retargeting for both physical humanoids and simulated agents.],[Advancing methods to bridge the embodiment gap between human demonstrations and robot execution, enabling high-throughput collection of richly annotated datasets for training robust, foundation model-based vision-language-action \(VLA\) policies.],)
  ],
  right-content: [
    July 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Human-In-The-Loop Robotic Simulator] 
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A simulation framework for physical human-robot interaction investigation and personalization of robotic systems.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Led development of a human-in-the-loop simulation framework for assistive robotics, with personalized digital twins across abilities. The pipeline integrates skeletal, musculoskeletal, and soft-body models, using reinforcement learning to simulate diverse capabilities and enable realistic, adaptive robot testing.],[Designed and validated a Real2Sim2Real framework to personalize robotic controllers for robot-assisted feeding and gait-assistive robots, enabling improved pHRI through simulation-informed adaptation and real-world testing.],[Investigated human-robot interaction modalities in simulation, including soft-body interaction dynamics, mass-spring-damper models, and other methods for accurately representing physical interactions.],)
  ],
  right-content: [
    Sept 2021 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mobile Third Arm Robot] 
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A vision-guided mobile third-arm cobot for patient transfers between a bed and wheelchair.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed and developed a complete vision-guided mobile third-arm cobot to assist caregivers in moderate assisted pivot transfers, covering mechanical design, electronics integration, and control systems.],[Implemented a human-tracking computer vision algorithm and developed human-robot interaction strategies for safe, intuitive operation between the caregiver, patient, and robot.],)
  ],
  right-content: [
    2020 -- 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design and Analysis of Underwater Robotic Systems] 
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A 3D-printed underwater robotic manipulator and flexible hull for an autonomous underwater vehicle.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed and 3D printed a bio-inspired underwater robotic manipulator and flexible hull structure, enabling object grasping and enhanced rigidity with reduced weight at depth.],[Performed finite element analysis to optimize the manipulator and hull designs for strength, hydrodynamic performance, and operational depth.],)
  ],
  right-content: [
    2018 -- 2019
  ],
)



== Work Experience


#two-col-entry(
  left-content: [
    #strong[Project Officer], Nanyang Technological University, Singapore -- Singapore
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Spearheaded the Human-In-The-Loop Robotic Simulator project, developing a platform that combines realistic human digital twins with assistive robots for human-in-the-loop simulations.],[Mentored seven final-year project students and collaborated with cross-functional research teams, including biomechanics experts, therapists, engineers, and research leads, to advance the simulator's development and application.],[Prepared funding proposals ranging from SGD 200K grants to multi-institutional proposals exceeding SGD 3 million to support ongoing and upcoming research initiatives.],)
  ],
  right-content: [
    Aug 2021 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Engineering Intern], #link("https://oishii.com/")[Oishii] -- New Jersey, USA
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Designed an indoor vertical farm structure accommodating 250,000 plants with a novel rack system that increased construction and assembly efficiency by 90\%.],[Pioneered development of a USD 400,000 R&D facility with ten independent growing environments tracking more than 80 plant parameters to determine optimal growth and yield.],[Led an engineering team of 12 as lead test engineer, implementing testing and troubleshooting schedules for all farm subsystems and bringing the world's largest indoor strawberry vertical farm facility into operation.],[Evaluated 32 engineering candidates and mentored 19 new engineering technicians to improve mechanical and electrical skills and align with company working norms.],)
  ],
  right-content: [
    June 2019 – June 2020
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Engineering Intern], #link("http://www.kanon-machine.com/en/index.asp")[Hangzhou Jialing Machinery Co. Ltd] -- Hangzhou, China
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Assisted in machining injection-molding machine parts using five-axis CNC machines and assembling Mitsubishi injection-molding machines on site.],[Performed CMM quality-control tests to verify the dimensional accuracy of machined parts.],[Planned and participated in business negotiations with Engel, KraussMaffei, Grob, and Makino Milling Machine Co. Ltd.],[Assisted with acceptance testing of a flexible manufacturing system production line worth RMB 3 million from StarragHeckert.],)
  ],
  right-content: [
    Dec 2016 – July 2017
  ],
)



== Publications


#two-col-entry(
  left-content: [
    #strong[ORBiT: Optimizing Robot-Assisted Bite Transfer Leveraging a Real2Sim2Real Framework]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);#strong[#emph[Sherwin Stephen Chan†]], J Anne Yow†, Yi Heng San, Vasanthamaran Ravichandram, Yifan Wang, Lek Syn Lim, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\), † Denotes equal contribution  ],
  right-content: [
    Oct 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Human-In-The-Loop Simulation Framework for Evaluating Control Strategies in Gait Assistive Robots]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Yifan Wang†, #strong[#emph[Sherwin Stephen Chan†]], Mingyuan Lei, Lek Syn Lim, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Robotics and Automation \(ICRA\), † Denotes equal contribution  ],
  right-content: [
    May 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Simulating Safe Bite Transfer in Robot-Assisted Feeding with a Soft Head and Articulated Jaw]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Yi Heng San†, Vasanthamaran Ravichandram†, J Anne Yow†, #strong[#emph[Sherwin Stephen Chan†]], Yifan Wang, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Rehabilitation Robotics \(ICORR\), † Denotes equal contribution  ],
  right-content: [
    May 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Personalised 3D Human Digital Twin with Soft-Body Feet for Walking Simulation]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Kum Yew Loke, #strong[#emph[Sherwin Stephen Chan]], Mingyuan Lei, Henry Johan, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Conference on Social Robotics \(ICSR\)  ],
  right-content: [
    Dec 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Creation and Evaluation of Human Models with Varied Walking Ability from Motion Capture for Assistive Device Development]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);#strong[#emph[Sherwin Stephen Chan]], Mingyuan Lei, Henry Johan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Rehabilitation Robotics \(ICORR\)  ],
  right-content: [
    Sept 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Investigation of Modeling Differences between OpenSim and Visual3D for Gait Analysis of Healthy Gait]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Beth Eng Wan Xuan, #strong[#emph[Sherwin Stephen Chan]], Henry Johan, Lek Syn Lim, Bingran Zuo, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Convention on Rehabilitation Engineering and Assistive Technology \(i-CREATe\)  ],
  right-content: [
    Aug 2023
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming Languages:] Python, C++, C]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Robotics and Simulation:] MuJoCo, OpenSim, Isaac Lab \(Gym\), ROS, SolidWorks, SolidEdge, STM32, ESP32, Linux]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning:] Reinforcement Learning, PyTorch, TensorFlow, Foundation Models, Vision-Language-Action Models]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Spoken Languages:] English, Chinese, Hokkien \(Dialect\), Tagalog]
)


== Awards and Achievements


#two-col-entry(
  left-content: [
    #strong[Dyson-NTU Innovation Challenge] -- #strong[Singapore]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Won first place in the annual innovation challenge organized by NTUitive.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Awarded an SGD 10,000 MDT grant to prototype an innovative smart planter addressing urban gardening challenges.],)
  ],
  right-content: [
    2021-04 -- 2021-09
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Overseas Entrepreneurship Program \(OEP\) Pitch Day Award] -- #strong[Singapore]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Founded HortiCole and secured funding for an IoT agricultural solution.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Awarded SGD 5,000 to develop a low-cost, modular IoT planter system with an alpha prototype in six months.],[Conducted market research with 400 participants and received strong market validation of 64.5\%.],)
  ],
  right-content: [
    2020-09 -- 2021-02
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SMRT-NTU Innovation Challenge Finalist] -- #strong[Singapore]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Finalist in an innovation challenge to devise inspection solutions for railway infrastructure.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a solution for inspecting rubber bearings and first-stage concrete beneath a floating slab.],)
  ],
  right-content: [
    2019-03 -- 2019-04
  ],
)



