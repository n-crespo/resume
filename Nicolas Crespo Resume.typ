#import "@preview/scienceicons:0.1.0": orcid-icon

#let resume(
  author: "",
  author-position: left,
  personal-info-position: left,
  pronouns: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  orcid: "",
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-font-size: 20pt,
  font-size: 10pt,
  body,
) = {
  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: font-size,
    lang: "en",
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )

  // Recommended to have 0.5in margin on all sides
  set page(
    margin: 0.5in,
    paper: paper,
  )

  // Link styles
  show link: underline


  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 700,
      size: author-font-size,
    )
    #pad(it.body)
  ]

  // Level 1 Heading
  [= #(author)]

  // Personal Info Helper
  let contact-item(value, prefix: "", link-type: "") = {
    if value != "" {
      if link-type != "" {
        link(link-type + value)[#(prefix + value)]
      } else {
        value
      }
    }
  }

  // Personal Info
  pad(
    top: 0.25em,
    align(personal-info-position)[
      #{
        let items = (
          contact-item(pronouns),
          contact-item(phone),
          contact-item(location),
          contact-item(email, link-type: "mailto:"),
          contact-item(github, link-type: "https://"),
          contact-item(linkedin, link-type: "https://"),
          contact-item(personal-site, link-type: "https://"),
          contact-item(orcid, prefix: [#orcid-icon(color: rgb("#AECD54"))orcid.org/], link-type: "https://orcid.org/"),
        )
        items.filter(x => x != none).join("  |  ")
      }
    ],
  )

  // Main body.
  set par(justify: true)

  body
}
// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}
// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}
// Cannot just use normal --- ligature because ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}
// Section components below
#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
  // Makes dates on upper right like rest of components
  consistent: false,
) = {
  if consistent {
    // edu-constant style (dates top-right, location bottom-right)
    generic-one-by-two(
      left: strong(institution) + ", " + emph(degree),
      right: dates,
      // bottom-left: emph(degree),
      // bottom-right: emph(location),
      // top-left: strong(institution) + ", " + emph(degree),
      // top-right: dates,
      // bottom-left: emph(degree),
      // bottom-right: emph(location),
    )
  } else {
    // original edu style (location top-right, dates bottom-right)
    generic-two-by-two(
      top-left: strong(institution),
      top-right: location,
      bottom-left: emph(degree),
      bottom-right: emph(dates),
    )
  }
}
#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}
#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  // pre-format the link if a url is provided
  let dest = if url != "" { link("https://" + url)[#url] }

  // determine content placement:
  // if dates exist, the url is appended to the name (left).
  // if dates are missing, the url is shown on the right.
  let left-suffix = if dates != "" and url != "" { [ (#dest)] }
  let right-content = if dates == "" and url != "" { dest } else { dates }

  // construct title based on if role exists
  let title = if role != "" { [*#role*, #name] } else { [*#name*] }

  generic-one-by-two(
    left: { title + left-suffix },
    right: right-content,
  )
}
#let certificates(
  name: "",
  issuer: "",
  url: "",
  date: "",
) = {
  [
    *#name*, #issuer
    #if url != "" {
      [ (#link("https://" + url)[#url])]
    }
    #h(1fr) #date
  ]
}
#let extracurriculars(
  activity: "",
  dates: "",
) = {
  generic-one-by-two(
    left: strong(activity),
    right: dates,
  )
}


// --------------------------------------------
// -------------- RESUME BELOW ----------------
// --------------------------------------------


// #let phone = "+1 (757) 621-2453"
#let name = "Nicolas Crespo"
#let location = ""
#let email = "ncrespo@ucla.edu"
#let github = "github.com/n-crespo"
#let linkedin = "linkedin.com/in/n-crespo"
#let phone = ""
#let personal-site = "ncrespo.com"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  // accent-color: "#ff0000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

/*
 * Lines that start with == are formatted into section headings
 * The following formatting functions are listed below
 * #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
 * #work(company: "", dates: "", location: "", title: "")
 * #project(dates: "", name: "", role: "", url: "")
 * certificates(name: "", issuer: "", url: "", date: "")
 * #extracurriculars(activity: "", dates: "")
 * There are also the following generic functions that don't apply any formatting
 * #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
 * #generic-one-by-two(left: "", right: "")
 * old import is preview / basic resume 0.2.8
 */

// Mission Statement
Aspiring computer engineer interested in building innovative, impactful solutions to complex technical problems.

== Education

#edu(
  institution: "University of California, Los Angeles",
  // location: "Los Angeles, California",
  dates: "Expected March 2028",
  degree: "B.S. in Computer Engineering",
  consistent: true,
)
- Operating Systems, Computer Architecture and Assembly Language, Machine Learning, Data Structures and Algorithms, Object Oriented Programming, Digital Logic Design, Systems and Signals, Discrete Mathematics, Differential Equations
- Active member of UCLA IEEE and UCLA ACM Cyber

// - Cumulative GPA: 4.0\/4.0 | Dean's List, Harvey S. Mudd Merit Scholarship, National Merit Scholarship
// - Computer Architecture and Assembly, Operating System Fundamentals, Electrical Engineering and Circuit Design, Data Structures and Algorithms, Object Oriented Programming, Malware Defense in Python, Discrete Mathematics, Physics (Mechanics, Oscillations, Electric/Magnetic Fields), Linear Algebra, Multivariable Calculus, Differential Equations

// #edu(
//   institution: "Governor's School for Science and Technology (GSST)",
//   // location: "Hampton, Virginia",
//   dates: dates-helper(start-date: "Sept 2022", end-date: "June 2024"),
//   degree: "Computational Sciences Strand (Dual Enrolled with VA Peninsula Community College)",
//   consistent: true
// )
// - GPA: 4.77 | Rank: 7/243 | GSST President's List | In conjunction with Tabb High School

== Work Experience

#project(
  role: "Formal Verification of Autonomous Systems Intern",
  // location: "Hampton, VA",
  name: "NASA Langley Research Center",
  dates: dates-helper(start-date: "June 2025", end-date: "Sept 2025"),
)
- Designed a domain-specific language embedding to model and test Detect-and-Avoid systems on autonomous aircraft.
- Created and formally verified a novel technique for assuring the safety of safety-critical Unmanned Aircraft Systems (UAS) by evaluating if untrusted or AI/ML generated flight instructions would violate predefined operational boundaries.
- Developed an automated proof strategy for guaranteeing flight safety and correctness, reducing verification time by >90%.
// - Created a novel technique for assuring the safety of mission-critical Unmanned Aircraft Systems in restricted airspaces by analyzing and formally verifying that AI generated flight instructions do not violate predefined operational boundaries.
// - Created and formally verified a novel technique for assuring the safety of mission-critical Unmanned Aircraft Systems by evaluating if and when untrusted flight instructions leave a predefined operational volume in a restricted airspace.
// - Integrated said strategy with the MetiTarski automatic theorem prover, Z3 SMT solver and leveraged PVS's trigonometry, real analysis and differential logic libraries for the specification of complex dynamical systems.

#project(
  role: "Software Engineer Intern",
  // location: "Newport News, Virginia",
  name: "Thomas Jefferson National Accelerator Facility",
  dates: dates-helper(start-date: "June 2024", end-date: "Aug 2024"),
)
- Engineered and integrated lab-wide inventory location tracking with session-persistent cookies into Jefferson Lab's (JLab) data management system to fully automate manual reporting procedures for 200+ lab engineers and improve data quality.
- Developed a unified fuzzy data searching system by consolidating JLab's cross-departmental Oracle SQL relational databases, reducing data retrieval time by >70% and improving search accuracy and efficiency across all lab departments.
- Source code and documentation on GitHub (#link("https://github.com/n-crespo/jlab-2024")[github.com/n-crespo/jlab-2024]).
// - Designed and integrated lab-wide, session-persistent location tracking and a fuzzy data searching system with JLab's relational inventory databases to streamline product traceability and automate data collection and retrieval.
// - Designed and integrated lab-wide session-persistent inventory location tracking into JLab's Pansophy Information System.
// - Enhance inventory tracking and automate data collection and retrieval.
// - Reduced manual data entry time for >200 lab engineers by >70% by automating their data management procedures.
// - Developed an internal validation system to improve data quality, minimize human error and improve lab-wide efficiency.

#project(
  role: "Computer Science Research Intern",
  // location: "Hampton, VA",
  name: "NASA Langley Research Center",
  dates: dates-helper(start-date: "Dec 2023", end-date: "Mar 2024"),
)
- Developed a productive conflict avoidance and recovery system for autonomous UAS in crowded airspaces.
- Formally verified the safety of this system as a fallback for untrusted ML/AI based controllers in safety-critical situations.
- Source code and documentation on GitHub (#link("https://github.com/n-crespo/NASA-2023")[github.com/n-crespo/NASA-2023]).
// as applications of the Runtime Assurance architecture (RTA), a general framework for design-time verification.
// and braking control systems for UAS operations in restricted airspace.
// - Formally verified both systems as fallbacks that a unmanned system's internal monitor can yield full control to once it detects that an untrusted black-box controller violated a safety property in a safety-critical situation.
// - Leveraged Carnegie Mellon's KeYmaeraX theorem prover and Plaidypvs, a formal embedding of differential dynamic logic (dL) in NASA's Prototype Verification System (PVS) to model and prove the correctness of these systems.
// - Co-authored two papers describing this research, listed below.

== Publications

#project(
  role: "A Verification Framework for Runtime Assurance of Autonomous UAS",
  dates: "Nov 2024",
  name: "IEEE",
)\
2024 AIAA DATC/IEEE Digital Avionics Systems Conference
(#link("https://ieeexplore.ieee.org/document/10748654")[https://ieeexplore.ieee.org/document/10748654])

#project(
  role: "A Formal Verification Framework for Runtime Assurance",
  dates: "May 2024",
  name: "Springer",
)\
2024 NASA Formal Methods Conference: 16th International Symposium
(#link("https://doi.org/10.1007/978-3-031-60698-4_19")[https://doi.org/10.1007/978-3-031-60698-4_19])

// Slagel, J. T., White, L. M., Dutle, A., Muñoz, C. A., & Crespo, N. A
// Verification Framework for Runtime Assurance of Autonomous UAS. In 2024 AIAA
// DATC/IEEE 43rd Digital Avionics Systems Conference (DASC)
// https://doi.org/10.1109/DASC62030.2024.10748654

// Slagel, J. T., White, L. M., Dutle, A., Muñoz, C. A., & Crespo, N. (2024). A
// Formal Verification Framework for Runtime Assurance. In A. Dutle, S. P. Miller,
// & C. A. Muñoz (Eds.), NASA Formal Methods: 16th International Symposium, NFM
// 2024, Proceedings (pp. 322–328). Springer.
// https://doi.org/10.1007/978-3-031-60698-4_19

== Projects

#project(
  role: "The Open Dissent",
  name: "Co-Founder and Software Engineer",
  url: "github.com/n-crespo/theopendissent",
  dates: "Ongoing",
)
- Building a serverless full-stack social platform using React, TypeScript, and Firebase Cloud Functions (Node.js).
- Created an CI/CD pipeline using GitHub Actions and Vercel to automate production deployments.
- Secured funding through the VOICE Initiative from the UC National Center for Free Speech and Civic Engagement.

// - Developing a dynamic back-end with integration with Firebase authentication and a Firebase real-time database.
// - Building an anonymized full-stack social media site for students with HTML/CSS/JavaScript with a Firebase real-time database and authentication.

#project(
  role: "VulnEx",
  name: "Team Lead and Backend Developer",
  dates: dates-helper(start-date: "Sept 2025", end-date: "Dec 2025"),
  url: "github.com/n-crespo/vulnex",
)
// - Optimized parsing 300k+ NVD CVE records, reducing fetching time by 96% (1hr to 2min) and storage requirements by 97% (7GB to 200MB).
- Optimized parsing of 300k+ CVE records, reducing fetching time by 96% (1hr to 2min) and storage requirements by 97%.
- Created an Express/MongoDB REST API, implementing secure JWT auth middleware and bulk CRUD operations.
- Built GitHub Actions CI/CD pipeline for automated deployment with 30+ E2E and integration tests (Mocha/Playwright).

#project(
  role: "High-Performance Image Manipulation Algorithms in C",
  name: "Developer",
  dates: "May 2025",
)
// - Optimized image convolution, greyscaling and mean pixel value algorithms with multi-threading and instruction level parallelism using OpenMP pragmas in C, resulting in a 12-15x speed up compared to sequential algorithms.
// - Optimized Gaussian convolution, pixel averaging, and greyscale algorithms in C to exploit instruction-level parallelism.
- Optimized Gaussian convolution and greyscaling algorithms in C to exploit cache locality and instruction-level parallelism.
- Achieved a 12-15x speedup over sequential baselines with multi-threading using OpenMP pragmas.

// smart memory access patterns
// calculating average pixel value across all pixels in an image
// program optimization, exploiting instruction level parallelism, cache friendly code, OpenMP pragmas,
// converting an image into greyscale, recording max/min greyscale values
// applying a convolution kernel for Gaussian blur and generating a convoluted image

// #project(
//   // name: "Sleep Apnea Analysis ML Data Pipeline (Caltech Hacktech 2025)",
//   role: "Nea: Machine Learning for Sleep Apnea Diagnosis (Hacktech 2025 @ Caltech)",
//   name: "Team Member",
//   dates: "Apr 2025",
// )
// - Created a data preparation pipeline in Python for cleaning and introducing deliberate noise into ML training data.

// #project(
//   role: "Cyber Kill Chain Implementation in a Modern Malware Toolkit",
//   name: "Developer and Team Member",
//   dates: "March 2025",
// )
// - Integrated the Shellshock exploit, a TCP/UDP port scanner, and a self-spawning persistence service in a malware package.

// - implemented shellshock exploit
// - wrote script to inject obfuscated alias hijacks and unkillable system service that repeatedly spawns malware to allow malware to persistent, complete with kill switch functionality (part of the cyber kill chain)
// - UDP/TCP port scanning script to search for open/vulnerable ports (enumeration)
// - integrated with modular malware written as a collection of bash/python scripts
// https://github.com/ucla-e1-malware/final-project-super-awesome-team-name

// course description: https://docs.google.com/presentation/d/1xysVRJklAOftKzuCsvcHOKGjpqCTxApDUAYXd4hV7Gs/edit?slide=id.g2d189806055_0_68#slide=id.g2d189806055_0_68
// notes: https://docs.google.com/document/d/14ZEV3X_aHz6Q-lGQqPbbiU-Pmlp-giVagoGj50S5LrY/edit?tab=t.0#heading=h.rt2kyxakv7tf
// #project(
//   name: "Physics Lab Thingamabob",
//   // role: "Maintainer",
//   dates: "May 2024",
//   url: "hello",
// )
// - Here is my one sentence summary

// final paper: https://docs.google.com/document/d/1msa5pa3ZJ9f7M8xl5WWVqDJ8wNo4vJqwhsK1miKzoo8/edit?tab=t.0#heading=h.x9ow4wpe1xxm
// final presentation: https://docs.google.com/presentation/d/1AYJKJRxdxor1oweXgHYW31GiCdUISCXUIGgrbMbPoR0/edit?slide=id.p1#slide=id.p1

// == Extracurricular Activities

// #extracurriculars(
//   activity: "Capture The Flag Competitions",
//   dates: dates-helper(start-date: "Jan 2021", end-date: "Present"),
// )

// #extracurriculars(
//   activity: "Science Olympiad Volunteering",
//   dates: "Sep 2023 --- Present"
// )

// #certificates(
//   name: "OSCP",
//   issuer: "Offensive Security",
//   // url: "",
//   date: "Oct 2024",
// )

== Skills
// - *Expertise*: Software Development | Formal Verification | Automated Theorem Proving | Data Analysis
- *Expertise*: Software Engineering | Formal Verification | Digital Logic Design | Circuit Design | Data Analysis
// - *Programming Languages*: C/C++ | ReactJS/NodeJS/JavaScript | SQL | Java | HTML/CSS | Python | R | Bash | Lua
- *Programming Languages*: C/C++ | x86 Assembly/MIPS | Python | Java | JavaScript/TypeScript | SQL | Bash | Typst
- *Technologies*: React | NodeJS | MongoDB | Playwright | ExpressJS | Vim/Neovim | Linux | Git/GitHub
