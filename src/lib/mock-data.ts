export const exams = [
  {
    slug: 'jeongchogi',
    name: '정보처리기사',
    shortName: '정처기',
    description: 'IT 분야 대표 국가기술자격증. 필기 핵심 이론부터 실기 대비까지 한 번에 준비합니다.',
    subjects: ['소프트웨어 설계', '소프트웨어 개발', '데이터베이스 구축', '프로그래밍 언어 활용', '정보시스템 구축관리'],
    questionCount: 120,
    resourceCount: 4,
    color: 'blue',
  },
  {
    slug: 'sqld',
    name: 'SQLD',
    shortName: 'SQLD',
    description: '데이터 모델링과 SQL 기본기를 빠르게 정리하는 데이터베이스 입문 자격증입니다.',
    subjects: ['데이터 모델링의 이해', 'SQL 기본 및 활용'],
    questionCount: 80,
    resourceCount: 2,
    color: 'emerald',
  },
  {
    slug: 'comhwal',
    name: '컴퓨터활용능력 1급',
    shortName: '컴활 1급',
    description: '스프레드시트와 데이터베이스 활용 능력을 검증하는 실무형 자격증입니다.',
    subjects: ['컴퓨터 일반', '스프레드시트 일반', '데이터베이스 일반'],
    questionCount: 60,
    resourceCount: 1,
    color: 'orange',
  },
]

export const resources = [
  {
    id: '1',
    examSlug: 'jeongchogi',
    title: '정처기 1과목 핵심 요약',
    description: '소프트웨어 설계에서 자주 출제되는 개념만 24페이지로 압축했습니다.',
    pages: 24,
    price: 0,
    type: 'PDF',
  },
  {
    id: '2',
    examSlug: 'jeongchogi',
    title: '정처기 2과목 핵심 요약',
    description: '소프트웨어 개발 파트의 암기 포인트와 기출 선택지를 함께 정리했습니다.',
    pages: 28,
    price: 4900,
    type: 'PDF',
  },
  {
    id: '3',
    examSlug: 'sqld',
    title: 'SQLD 핵심 개념 정리',
    description: '데이터 모델링과 SQL 기본 문법을 시험 전날 보기 좋게 구성했습니다.',
    pages: 32,
    price: 0,
    type: 'PDF',
  },
  {
    id: '4',
    examSlug: 'jeongchogi',
    title: '정처기 실기 완벽 대비',
    description: '실기 빈출 키워드, 서술형 대비 문장, 약술형 템플릿을 묶은 자료입니다.',
    pages: 56,
    price: 9900,
    type: 'PDF',
  },
]

export function getExam(slug: string) {
  return exams.find((exam) => exam.slug === slug)
}

export function getResource(id: string) {
  return resources.find((resource) => resource.id === id)
}
