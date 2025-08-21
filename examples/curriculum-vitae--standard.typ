#import "../lib/lib-curriculum-vitae--standard.typ":curriculum_vitae,information,job_experience,academic_project,academic_background

// job experiences
// ---------------
#let job_experience_dummy=job_experience(
  
)

#let job_experience_dummy_description=job_experience(
  description:lorem(10),
)

// academic projects
// -----------------
#let academic_project_first_dummy=academic_project(
  is_first: true,
  span:"Month YYYY - Month YYYY",
  tools:("Tool A","Tool B","Tool C")
)

#let academic_project_dummy=academic_project(
)

// academic backgrounds
// --------------------
#let academic_background_dummy=academic_background()

#curriculum_vitae(
  content:[
        #information(
        title:"job experiences",
        spacing: 1em,
        ..arguments(
          job_experience_dummy_description,
          job_experience_dummy,
          job_experience_dummy
        )
    )

    #information(
      title:"academic projects",
      spacing:1em,
      ..arguments(
        academic_project_first_dummy,
        academic_project_dummy,
        academic_project_dummy
      )
    )

    #information(
      title:"academic backgrounds",
      spacing:0.75em,
      ..arguments(
        academic_background_dummy,
        academic_background_dummy,
        academic_background_dummy,
      )
    )
  ]
)
