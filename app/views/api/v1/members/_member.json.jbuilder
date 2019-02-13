json.merge! member.attributes
json.profile_pic url_for(member.profile_pic) if member.profile_pic.attached?