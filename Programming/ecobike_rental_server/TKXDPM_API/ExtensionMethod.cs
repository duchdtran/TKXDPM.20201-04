using Newtonsoft.Json;

namespace TKXDPM_API
{
    public static class ExtensionMethod
    {
        public static string ToJson<T>(this T obj)
        {
            return JsonConvert.SerializeObject(obj, Formatting.Indented);
        }
    }
}