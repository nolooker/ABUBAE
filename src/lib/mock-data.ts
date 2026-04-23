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

export const questions = [
  {
    id: 'q-001',
    examSlug: 'jeongchogi',
    year: 2023,
    round: 2,
    subject: '소프트웨어 설계',
    number: 1,
    difficulty: 2,
    content: '소프트웨어 설계에서 요구사항 분석 기법 중 구조적 분석 기법에 해당하지 않는 것은?',
    choices: ['데이터 흐름도(DFD)', '자료 사전(DD)', '유스케이스 다이어그램', '소단위 명세서(Mini-Spec)'],
    answer: 2,
    explanation: '유스케이스 다이어그램은 객체지향 분석에서 주로 사용하는 UML 다이어그램입니다.',
  },
  {
    id: 'q-002',
    examSlug: 'jeongchogi',
    year: 2023,
    round: 2,
    subject: '소프트웨어 개발',
    number: 2,
    difficulty: 3,
    content: '소프트웨어 테스트에서 결함이 집중적으로 발생하는 모듈을 우선 점검하는 원리는?',
    choices: ['살충제 패러독스', '파레토 법칙', '오류 부재의 궤변', '완벽한 테스트 불가능'],
    answer: 1,
    explanation: '파레토 법칙은 전체 결함의 상당수가 일부 모듈에 집중된다는 관점으로 설명됩니다.',
  },
  {
    id: 'q-003',
    examSlug: 'sqld',
    year: 2024,
    round: 1,
    subject: 'SQL 기본 및 활용',
    number: 1,
    difficulty: 2,
    content: 'GROUP BY 절과 함께 사용하며 그룹별 조건을 지정할 때 사용하는 절은?',
    choices: ['WHERE', 'HAVING', 'ORDER BY', 'JOIN'],
    answer: 1,
    explanation: 'HAVING은 GROUP BY 결과에 대한 조건을 지정할 때 사용합니다.',
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
