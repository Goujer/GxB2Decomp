using System;
using System.Collections.Generic;

namespace BestHTTP.SignalRCore.Messages
{
	public sealed class NegotiationResult
	{
		public string ConnectionId { get; private set; }

		public List<SupportedTransport> SupportedTransports { get; private set; }

		public Uri Url { get; private set; }

		public string AccessToken { get; private set; }

		internal static NegotiationResult Parse(string json, out string error)
		{
			error = null;
			return null;
		}
	}
}
