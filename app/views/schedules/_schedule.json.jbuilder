json.extract! schedule, :id, :schedules_id, :sch_train_id, :starting_time, :reaching_time, :src_place_id, :dst_place_id, :tour_fare, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
