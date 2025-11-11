#import "@preview/basic-resume:0.2.8": *

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
 */

// Mission Statement
Aspiring computer engineer interested in building innovative, impactful solutions to complex technical problems.

== Education

#edu(
  institution: "University of California, Los Angeles",
  // location: "Los Angeles, California",
  dates: dates-helper(start-date: "Sept 2024", end-date: "June 2028"),
  degree: "Bachelor's of Science, Computer Engineering",
  consistent: true,
)
- Operating System Fundamentals, Computer Architecture and Assembly Language, Intro to Machine Learning, Data Structures and Algorithms, Digital Logic Design, Object Oriented Programming, Intro to Circuit Design, Systems and Signals, Malware Defense, Linear Algebra, Discrete Mathematics, Multivariable Calculus, Differential Equations
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
- Developed a unified fuzzy data searching system by consolidating JLab's cross-departmental relational Oracle SQL databases, reducing data retrieval time by >70% and improving search accuracy and efficiency across all lab departments.
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
  url: "www.theopendissent.com",
  dates: "Ongoing",
)
- Built a full-stack social media site with HTML/CSS/TypeScript with Google authentication and a realtime database.
// - Awarded funding via the University of California VOICE Initiative from the National Center for Free Speech.

// - Developing a dynamic back-end with integration with Firebase authentication and a Firebase real-time database.
// - Building an anonymized full-stack social media site for students with HTML/CSS/JavaScript with a Firebase real-time database and authentication.

#project(
  role: "High-Performance Image Manipulation Algorithms in C",
  name: "Developer",
  dates: "May 2025",
)
- Optimized image convolution, grayscaling and mean pixel value algorithms with multi-threading and instruction level parallelism using OpenMP pragmas in C, resulting in a 12-15x speed up compared to sequential algorithms.

// calculating average pixel value across all pixels in an image
// program optimization, exploiting instruction level parallelism, cache friendly code, OpenMP pragmas,
// converting an image into grayscale, recording max/min grayscale values
// applying a convolution kernel for gassian blur and generating a convoluted image

#project(
  // name: "Sleep Apnea Analysis ML Data Pipeline (Caltech Hacktech 2025)",
  role: "Nea: Machine Learning for Sleep Apnea Diagnosis (Hacktech 2025 @ Caltech)",
  name: "Team Member",
  dates: "Apr 2025",
)
- Created a data preparation pipeline in Python for cleaning and introducing deliberate noise into ML training data.

#project(
  role: "Cyber Kill Chain Implementation in a Modern Malware Toolkit",
  name: "Developer and Team Member",
  dates: "March 2025",
)
- Integrated the Shellshock exploit, a TCP/UDP port scanner, and a self-spawning persistence service in a malware package.

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
- *Programming Languages*: C/C++ | x86 Assembly/MIPS | Python | Java | Bash | JavaScript/TypeScript | SQL | Typst
- *Technologies*: React | NodeJS | MongoDB | Oracle SQL | Vim/Neovim | Linux | Git/GitHub
