<template>
  <div class="infinite-list-wrapper" style="overflow:auto">
    <ul
      v-infinite-scroll="load"
      class="list"
      infinite-scroll-disabled="disabled"
    >
      <li v-for="pub in publics" :key="pub.id" class="list-item">
        <div class="l-wrapper_01">
          <article class="card_01">
            <div class="card__header_01">
              <p class="card__title_01">{{ pub.title }}</p>
              <figure class="card__thumbnail_01">
                <img src="https://dubdesign.net/wp-content/uploads/2020/05/0514_inhouse_designereyecatch.jpg" alt="サムネイル" class="card__image_01">
              </figure>
            </div>
            <div class="card__body_01">
              <p class="card__text2_01">{{ pub.content }}</p>
            </div>
            <div class="card__footer_01">
              <p class="card__text_01"><a href="#" class="button_01 -compact">この記事を詳しく見る</a></p>
            </div>
          </article>
        </div>
      </li>
    </ul>
    <p v-if="loading">Loading...</p>
    <p v-if="noMore">No more</p>
  </div>
</template>

<script>
export default {
  props: {
    publics: {
      type: Array,
      default() {
        return []
      }
    }
  },
  data() {
    return {
      count: 10,
      loading: false
    }
  },
  computed: {
    noMore() {
      return this.count >= 20
    },
    disabled() {
      return this.loading || this.noMore
    }
  },
  methods: {
    load() {
      this.loading = true
      setTimeout(() => {
        this.count += 2
        this.loading = false
      }, 2000)
    }
  }
}
</script>

<style>
.l-wrapper_01 {
  margin: 1rem auto;
  width: 95%;
}

.l-wrapper_01:hover {
  transform: translateY(-3px);
  box-shadow: 0 7px 14px rgba(50,50,93,.1), 0 3px 6px rgba(0,0,0,.08);
  transition: all .5s;
}

.card_01 {
  background-color: #fff;
  box-shadow: 0 0 8px rgba(0, 0, 0, .16);
  color: #212121;
  text-decoration: none;
}

.card__header_01 {
  display: flex;
  flex-wrap: wrap;
}

.card__title_01 {
  padding: 1rem 1.5rem 0;
  font-size: 1.6rem;
  order: 1;
  margin-bottom: 0.6rem;
  font-weight: bold;
  text-decoration: none;
}

.card__thumbnail_01 {
  margin: 0;
  order: 0;
}

.card__image_01 {
  width: 50%;
}

.card__body_01 {
  padding: 0 1.5rem;
}

.card__text_01 {
  font-size: .8rem;
  text-align:center;
  text-decoration: none;
	padding-bottom: 0;
}

.card__text2_01 {
  font-size: .8rem;
  margin-top: 0;
  margin-bottom: 2rem;
}

.card__text_01 + .card__text_01 {
  margin-top: .5rem;
}

.card__footer_01 {
  padding: 1rem;
  border-top: 1px solid #ddd;
}

.button_01 {
  display: inline-block;
  text-decoration: none;
  transition: background-color .3s ease-in-out;
  text-align: center;
}

.button_01 a {
  text-decoration: none;
}

.button_01.-compact {
  padding: .5rem 1rem;
  border-radius: .25rem;
  background-color: #4f96f6;
  color: #fff;
  font-weight: bold;
	text-decoration: none;
}

.button_01.-compact:hover,
.button_01.-compact:focus {
  background-color: #6bb6ff;
}
</style>
