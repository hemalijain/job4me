json.array! @interviews.to_a do |interview|

  date_format = interview.all_day_interview? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id interview.id
  json.title interview.title
  json.start interview.start.strftime(date_format)
  json.end interview.end.strftime(date_format)
  json.color interview.color unless interview.color.blank?
  json.allDay interview.all_day_interview? ? true : false
  json.update_url interview_path(interview, method: :patch)
  json.edit_url edit_interview_path(interview)
end