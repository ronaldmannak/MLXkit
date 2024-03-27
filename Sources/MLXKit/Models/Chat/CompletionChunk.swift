//
//  CompletionChunk.swift
//
//
//  Created by Ronald Mannak on 3/27/24.
//

import Foundation

/// The chat completion chunk object
/// Represents a streamed chunk of a chat completion response returned by model, based on the provided input.
/// # See also
/// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
public struct CompletionChunk: Codable {

    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
    public struct Choice: Codable {
        
        /// A chat completion delta generated by streamed model responses.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
        public struct Delta: Codable {
            
            /// The contents of the chunk message.
            /// # See also
            /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
            let content: String?
            
            /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
            /// # See also
            /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
            @available(*, deprecated, message: "Use tools and ToolChoice instead")
            let functionCall: FunctionCall?
            
            /// # See also
            /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
            let toolCalls: [ToolCall]?
            
            /// The role of the author of this message.
            /// # See also
            /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
            /// # Remarks
            /// - According to the OpenAI documentation, `role` cannot be `NULL`. However, in the examples role is `NULL` in the all but the first chunk.
            let role: Role?
        }
        
        /// Log probability information for the choice.
        /// A chat completion delta generated by streamed model responses.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
        let delta: Delta
        
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
        let logprobs: LogProbs?
        
        /// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, `content_filter` if content was omitted due to a flag from our content filters, `tool_calls` if the model called a tool, or `function_call` (deprecated) if the model called a function.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
        let finishReason: FinishReason?
        
        /// The index of the choice in the list of choices.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming)
        let index: Int
    }
    
    /// A unique identifier for the chat completion. Each chunk has the same ID.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-id)
    public let id: String

    /// A list of chat completion choices. Can be more than one if n is greater than 1.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-choices)
    public let choices: [Choice]

    /// The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-created)
    public let created: Int

    /// The model to generate the completion.
    /// E.g. `mlx-community/Nous-Hermes-2-Mistral-7B-DPO-4bit-MLX`
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-model)
    public let model: String

    /// This fingerprint represents the backend configuration that the model runs with. Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-system_fingerprint)
    public let systemFingerprint: String
    
    /// The object type, which is always `chat.completion.chunk`
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/streaming#chat/streaming-object)
    public var object: String = "chat.completion.chunk"
}