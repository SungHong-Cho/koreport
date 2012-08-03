# -*- coding: utf-8 -*-
module KoreportHelper
  def user_buckets_path(report)
    if user_signed_in?
      buckets_path(current_user, :report_id => report.id)
    else
      new_user_session_path
    end
  end

  def find_univ_name(report)
    @univs = ["강원대학교", "건국대학교", "경북대학교", "경희대학교", "고려대학교", "광운대학교", "국민대학교", "단국대학교", "동국대학교", "부산대학교", "서강대학교", "세종대학교", "숭실대학교", "서울대학교", "아주대학교", "연세대학교", "인하대학교", "전남대학교", "전북대학교", "중앙대학교", "충남대학교", "충북대학교", "한동대학교", "홍익대학교", "경인교육대학교", "서울교육대학교", "서울여자대학교", "성균관대학교", "숙명여자대학교", "유니스트", "이화여자대학교", "카이스트", "포항공과대학교", "한국외국어대학교", "한국교원대학교", "한양대학교"]

    report.univs.each do |univ|
      return univ.name if @univs.include?(univ.name)
    end
    return "package"
  end

  def print_compact(text)
    if text.length > 140
      text[0,140] + "..."
    else
      text[0,140]
    end
  end

end
