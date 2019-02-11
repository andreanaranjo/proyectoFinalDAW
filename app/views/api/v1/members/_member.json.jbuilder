json.merge! api_v1_member.attributes
json.profile_pic url_for(api_v1_member.profile_pic) if api_v1_member.profile_pic.attached?