<script context="module">
  export function load({ status, error }) {
    return {
      props: {
        status: status,
        message: error.message,
      },
    };
  }
</script>

<script>
  export let status;
  export let message;
</script>

<div>
  <p>{status}</p>
  <p>{message}</p>
</div>
