namespace :politicians do
  desc "TODO"
  task profile_update: :environment do
    TwitterGetterJob.perform_later
  end

  task :seed, [:congress] => [:environment] do |task, args|
    chambers = ['house', 'senate']
    chambers.each do |chamber|
      service = PropublicaService.new(args[:congress], chamber)
      members = service.get_members
      members.each do |member|
        if Politician.exists?(govtrack_id: member[:govtrack_id])
          politician = Politician.find_by(govtrack_id: member[:govtrack_id])
          politician.update(member)
          puts "Updated #{politician.title} #{politician.last_name}"
        else
          politician = Politician.new(member)
          politician.save
          puts "Created #{politician.title} #{politician.last_name}"
        end
      end
    end
  end
end