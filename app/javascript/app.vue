<template>
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved" >
    <list v-for="(list, index) in lists" :list="list"></list>
  </draggable>
</template>

<script>
import draggable from 'vuedraggable'
import list from 'components/list'

export default {
  components: { draggable, list },
  props: ["original_lists"],

  data: function() {
    return {
      lists: this.original_lists,
      editing: false,
      message: "",
    }
  },

  methods: {
    startEditing: function() {
      this.editing = true
      this.$nextTick(() => { this.$refs.message.focus() })
    },

    listMoved: function(event) {
      var data = new FormData      
      data.append("list[position]", event.newIndex + 1)


      Rails.ajax({
        beforeSend: () => true,
        url: `/lists/${this.lists[event.newIndex].id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json",
      })
    },

    submitMessage: function() {
      var data = new FormData
      data.append("list[name]", this.message)

      Rails.ajax({
        beforeSend: () => true,
        url: "/lists",
        type: "POST",
        data: data,
        dataType: "json",
        success: (data) => {
          window.store.lists.push(data)
          this.message = ""
          this.edting = false
        }
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.dragArea {
  min-height: 20px;
}

.board {
  white-space: nowrap;
  overflow-x: auto;
}

.list {
  background: #E2E4E6;
  border-radius: 3px;
  display: inline-block;
  margin-right: 20px;
  padding: 10px;
  vertical-align: top;
  width: 270px;
}

</style>
