"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[1621],{4360:(e,t,n)=>{n.r(t),n.d(t,{HomeV2FullPageSection:()=>K,SKELETON_CARDS_COUNT:()=>E,default:()=>U});var a=n(30758),o=n(64888),s=n(97500),i=n.n(s),c=n(41978),r=n(77),l=n(41331),m=n(62462),d=n(7029),u=n(76962),h=n(39733),g=n(48474),p=n(44506),S=n(42365),f=n(56374),x=n(56093),_=n(86070);const y=({section:e})=>(0,_.jsx)(f.p,{id:e.uri,title:e.data.title?.text??"",showAll:!0,index:0,rowGap:S.lT,fullPage:!0,children:e.sectionItems.items.map(x.Gx)});var j=n(66371),H=n(56336),w=n(97295),D=n(57189);const v=({section:e})=>(0,_.jsx)(w.x,{config:(0,D.s1)(D.yV.HOME_LOW_DENSITY),children:(0,_.jsx)(f.p,{id:e.uri,title:e.data.title?.text??"",showAll:!0,index:0,rowGap:(0,j.po)("looser"),fullPage:!0,children:e.sectionItems.items.map(H.G)})});var C=n(47996);const I=({section:e})=>(0,_.jsx)(w.x,{config:(0,D.s1)(D.yV.MUSIC_VIDEOS),children:(0,_.jsx)(f.p,{id:e.uri,title:l.Ru.get("music_videos"),showAll:!0,index:0,rowGap:(0,j.po)("looser"),fullPage:!0,children:e.sectionItems.items.map(((e,t)=>{if("TrackResponseWrapper"!==e.content.__typename||"Track"!==e.content.data.__typename)return null;const n=e.content.data;return(0,_.jsx)(C.O,{title:n.name,trackUri:n.uri,artists:n.artists.items,album:n.albumOfTrack,contentRating:n.contentRating,referrerIdentifier:"other",index:t},n.uri)}))})});var O=n(19019),A=n(91753);const P=({section:e})=>{const t=(0,h.NC)(O.hWV);switch("spotify:section:0JQ5DAnM3wGh0gz1MXnu3K"===e.uri&&t&&e.data&&(e.data.__typename="HomeGridSectionData"),e.data?.__typename){case"HomeGenericSectionData":return(0,_.jsx)(y,{section:(0,p.M)(e,e.data)});case"HomeMusicVideosSectionData":return(0,_.jsx)(I,{section:(0,p.M)(e,e.data)});case"HomeShortsSectionData":case"HomeRecentlyPlayedSectionData":case"HomeFeedBaselineSectionData":case"HomeNativeAdsSectionData":case"HomeOnboardingSectionData":return null;case"HomeGridSectionData":return t?(0,_.jsx)(v,{section:(0,p.M)(e,e.data)}):null;case"HomeSpotlightSectionData":case"HomePromotionSectionData":case null:case void 0:case"HomeFeatureActivationSectionData":case"HomeWatchFeedSectionData":case"HomeOnboardingSectionDataV2":case"HomeYourDJSectionData":return null;case"HomeFeatureActivationSectionDataV2":return(0,_.jsx)(g.G,{sectionItems:e.sectionItems.items,showAll:!0,uri:e.uri,localStorageKey:e.data.localStorageKey});default:return(0,A.k)(e.data),null}};var N=n(49237),b=n(81889);const k=(0,a.memo)((({cardCount:e})=>(0,_.jsx)(b._,{isLoading:!0,showAll:!0,withTitle:!0,children:[...new Array(e).keys()].map(((e,t)=>(0,_.jsx)(N.u,{isLoading:!0},t)))})));var G=n(84266),M=n(24853),R=n(98957),T=n(95168),F=n(52833),L=n(81481),V=n(20683);const E=10,J=({uri:e})=>{const t=(0,r.zy)(),n=new URLSearchParams(t.search).get("pCountry"),s=(0,c.d4)(M.JJ),{request:m}=(0,a.useContext)(T.j),{data:h,isLoading:g,error:p}=(0,o.q)({queryKey:["homeV2","section",e,{numberOfItems:20}],queryFn:async({pageParam:t})=>(0,F.c)(m,u.U3,{uri:e,timeZone:(0,G.Ff)(),sp_t:(0,R.v8)("sp_t")??"",country:n??s,sectionItemsOffset:t,sectionItemsLimit:20}),initialPageParam:0,getNextPageParam:e=>{if("HomeSectionCollection"===e?.data?.homeSections?.__typename&&"HomeSection"===e.data.homeSections.sections[0]?.__typename){const t=e.data.homeSections.sections[0]?.sectionItems.pagingInfo;return t.nextOffset&&t.nextOffset>0?t.nextOffset:void 0}},gcTime:G.gO,staleTime:G.jl}),S=(0,a.useMemo)((()=>h?.pages?h.pages.reduce(((e,t)=>{if(!t?.data?.homeSections||"HomeSectionCollection"!==t?.data?.homeSections.__typename||0===t.data.homeSections.sections.length)return e;switch(t.data.homeSections.sections[0]?.__typename){case"HomeSection":return null===e?(0,L.h)(t.data.homeSections.sections[0]):(e.sectionItems.items=[...e.sectionItems.items,...t.data.homeSections.sections[0].sectionItems.items],e);case"GenericError":case"NotFound":return e;default:return(0,A.k)(t.data.homeSections.sections[0]),e}}),null):null),[h?.pages]);if(g)return(0,_.jsx)("section",{"data-testid":"home-page",children:(0,_.jsx)("div",{className:V.A.home,children:(0,_.jsx)("div",{className:i()(V.A.homepageContent,"contentSpacing"),children:(0,_.jsx)(k,{cardCount:E})})})});if(null!==p)return(0,_.jsx)(d.LoadingPage,{hasError:!0,errorMessage:l.Ru.get("error.generic")});const f=h?.pages[0]?.data?.homeSections;return"HomeSectionCollection"!==f?.__typename||0===f.sections.length||"HomeSection"!==f.sections[0]?.__typename||null===S?(0,_.jsx)(d.LoadingPage,{hasError:!0,errorMessage:l.Ru.get("error.generic")}):(0,_.jsx)("section",{"data-testid":"home-section-page",children:(0,_.jsx)("div",{className:V.A.home,children:(0,_.jsx)("div",{className:i()(V.A.homepageContent,"contentSpacing"),children:(0,_.jsx)(P,{section:S})})})})},K=({uri:e})=>(0,_.jsxs)(_.Fragment,{children:[(0,_.jsx)(m.Q,{children:l.Ru.get("page.generic-title")}),(0,_.jsx)(J,{uri:e})]}),U=K},81481:(e,t,n)=>{n.d(t,{h:()=>a});n(95914),n(83737);function a(e){return"object"!=typeof e||null===e?e:window.structuredClone?window.structuredClone(e):JSON.parse(JSON.stringify(e))}}}]);
//# sourceMappingURL=home-v2-section.js.map