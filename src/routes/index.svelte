<script>
  import { onMount } from "svelte";
  const BACKEND_URL = import.meta.env.VITE_BACKEND_URL;

  let res = "";
  let msg = "";

  async function getMessage() {
    res = await fetch(BACKEND_URL);
    msg = await res.json();
  }

  onMount(getMessage);
</script>

<h1 class="text-3xl font-bold underline">
  {msg}
</h1>
<button class="btn">Button</button>
